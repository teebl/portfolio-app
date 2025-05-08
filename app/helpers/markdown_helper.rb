module MarkdownHelper
  def markdown_dir(subfolder)
    Rails.root.join("app", "assets", "markdown", subfolder)
  end

  def filenames(subfolder)
    Dir.entries(markdown_dir(subfolder)).drop(2).map { |f| f.chomp(".md") }
  end

  def parse_markdown_files(subfolder)
    filenames(subfolder).map { |source| parse_markdown_file("#{subfolder}/#{source}") }.sort_by { |b| b[:date] }.reverse
  end

  def parse_markdown_file(source)
    file_path = "#{markdown_dir("")}/#{source}.md"
    parsed = FrontMatterParser::Parser.parse_file(file_path)

    front_matter = parsed.front_matter || {}
    front_matter = front_matter.compact.transform_keys { |k| k&.to_sym || :unknown }

    front_matter.merge({
      html: markdown(parsed.content),
      source: source,
      date: front_matter[:date] || Date.today
    })
  rescue => e
    Rails.logger.error "Failed to parse markdown file #{file_path}: #{e.message}"
    {
      title: "Error: #{source}",
      html: "<p>This content could not be loaded.</p>",
      source: source,
      date: Date.today
    }
  end

  private
  def markdown(text)
    extensions = {
      autolink:           true,
      highlight:          true,
      superscript:        true,
      disable_indented_code_blocks: true,
      space_after_headers: true,
      fenced_code_blocks: true
    }

    markdown = Redcarpet::Markdown.new(CustomRender, extensions)

    markdown.render(text).html_safe
  end
end

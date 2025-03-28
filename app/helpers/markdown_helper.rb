module MarkdownHelper
  def markdown_dir
    Rails.root.join("app", "assets", "markdown")
  end

  def filenames
    Dir.entries(markdown_dir).drop(2).map { |f| f.chomp(".md") }
  end

  def parse_markdown_files
    filenames.map { |source| parse_markdown_file("#{source}") }.sort_by { |b| b[:date] }.reverse
  end

  def parse_markdown_file(source)
    parsed = FrontMatterParser::Parser.parse_file("#{markdown_dir}/#{source}.md")

    parsed.front_matter.merge({ html: redcarpet.render(parsed.content), source: source }).transform_keys(&:to_sym)
  end

  private
    def redcarpet
      @redcarpet ||= Redcarpet::Markdown.new(CustomRender)
    end
end

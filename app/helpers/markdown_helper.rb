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
    parsed = FrontMatterParser::Parser.parse_file("#{markdown_dir("")}/#{source}.md")

    parsed.front_matter.merge({ html: redcarpet.render(parsed.content), source: source }).transform_keys(&:to_sym)
  end

  private
    def redcarpet
      @redcarpet ||= Redcarpet::Markdown.new(CustomRender)
    end
end

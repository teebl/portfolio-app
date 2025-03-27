module MarkdownHelper
  def markdown_dir
    Rails.root.join("app", "assets", "markdown")
  end

  def parse_markdown(source)
    parsed = FrontMatterParser::Parser.parse_file(get_path(source))
    metadata = parsed.front_matter

    metadata.merge({ html: redcarpet.render(parsed.content), source: source }).transform_keys(&:to_sym)
  end

  private
    def get_path(source)
      Rails.root.join(markdown_dir, "#{source}.md")
    end

    def redcarpet
      @redcarpet ||= Redcarpet::Markdown.new(CustomRender)
    end
end

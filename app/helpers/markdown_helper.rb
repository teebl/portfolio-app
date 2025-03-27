module MarkdownHelper
  def markdown_dir
    Rails.root.join("app", "assets", "markdown")
  end

  def parse_markdown(source)
    file = File.read(get_path(source))

    markdown.render(file)
  end

  private
    def get_path(source)
      Rails.root.join(markdown_dir, "#{source}.md")
    end

    def markdown
      @markdown ||= Redcarpet::Markdown.new(CustomRender)
    end
end

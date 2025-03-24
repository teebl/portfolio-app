class AboutController < ApplicationController
  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    path = Rails.root.join("app", "assets", "markdown", "about.md")

    render inline: markdown.render(File.read(path)), layout: "application"
  end
end

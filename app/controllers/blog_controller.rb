class BlogController < ApplicationController
  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)


    path = Rails.root.join("app", "assets", "blog", "foo.md")

    render inline: markdown.render(File.read(path)), layout: "application"
  end
end

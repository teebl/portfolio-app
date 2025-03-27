class BlogController < ApplicationController
  include MarkdownHelper

  def index
    @blog_hashes = blog_files.map do |file_name|
      [ file_name, parse_markdown("blog/#{file_name}") ]
    end
  end

  def show
    @blog_post = parse_markdown("blog/#{params[:id]}")
  end

  private
    def blogs_dir
      Rails.root.join(markdown_dir, "blog")
    end

    def blog_files
      Dir.entries(blogs_dir).drop(2).map { |f| f.chomp(".md") }
    end
end

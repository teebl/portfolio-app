class BlogController < ApplicationController
  include MarkdownHelper

  def index
    @parsed_blogs = blog_files.map do |source|
      parse_markdown("#{source}")
    end

    @parsed_blogs = @parsed_blogs.sort_by { |b| b[:date] }.reverse
  end

  def show
    @blog_post = parse_markdown("#{params[:id]}")
  end

  private
    def blogs_dir
      Rails.root.join(markdown_dir)
    end

    def blog_files
      Dir.entries(blogs_dir).drop(2).map { |f| f.chomp(".md") }
    end
end

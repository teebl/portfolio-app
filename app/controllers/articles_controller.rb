class ArticlesController < ApplicationController
  include MarkdownHelper

  def index
    @articles = parse_markdown_files
  end

  def show
    @article = parse_markdown_file("#{params[:id]}")
  end
end

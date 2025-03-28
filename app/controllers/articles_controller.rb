class ArticlesController < ApplicationController
  include MarkdownHelper

  def index
    @articles = parse_markdown_files(params[:path])
  end

  def show
    @article = parse_markdown_file("#{params[:path]}/#{params[:id]}")
  end
end

class BlogController < ApplicationController
  include BlogHelper

  def index
    @parsed_blogs = blogs_by_date_desc
  end

  def show
    @blog_post = parse_markdown("#{params[:id]}")
  end
end

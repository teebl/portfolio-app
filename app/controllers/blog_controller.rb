class BlogController < ApplicationController
  def index
    @blog_hashes = all_file_names.map do |file_name|
      [ file_name.chomp(".md"), get_file_data(file_name) ]
    end
  end

  def show
    @blog_post = get_file_data(params[:id] + ".md")
  end


  private
  def folder_path
    Rails.root.join("app", "assets", "markdown", "blog")
  end

  def all_file_names
    Dir.entries(folder_path).drop(2)
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(CustomRender)
  end

  def get_file_data(file_name)
    markdown.render(File.read(Rails.root.join(folder_path, file_name)))
  end
end

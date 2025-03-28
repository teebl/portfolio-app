class DashboardController < ApplicationController
  include MarkdownHelper
  def index
    # This parses all the articles in order to get the most recent
    # Should performance become a problem, consider having the date in the filename, for faster sorting
    @latest_article =  parse_markdown_files[0]
  end
end

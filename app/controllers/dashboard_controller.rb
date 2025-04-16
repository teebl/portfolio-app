class DashboardController < ApplicationController
  include MarkdownHelper
  def index
    # This parses all the articles in order to get the most recent
    # Should performance become a problem, consider having the date in the filename, for faster sorting
    @latest_article =  parse_markdown_files("posts")[0]
    @featured_project = parse_markdown_file("projects/old_portfolio_project")
  end
end

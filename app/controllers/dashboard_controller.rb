class DashboardController < ApplicationController
  include BlogHelper
  def index
    @latest_blog = latest_blog
  end
end

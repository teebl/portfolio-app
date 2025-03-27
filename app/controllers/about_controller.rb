class AboutController < ApplicationController
  include MarkdownHelper
  
  def index
    render inline: parse_markdown("about"), layout: "application"
  end
end

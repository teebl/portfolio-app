module BlogHelper
  include MarkdownHelper

  def blogs_dir
    Rails.root.join(markdown_dir)
  end

  def blog_files
    Dir.entries(blogs_dir).drop(2).map { |f| f.chomp(".md") }
  end

  def parse_blogs
    blog_files.map { |source| parse_markdown("#{source}") }
  end

  def blogs_by_date_desc
    parse_blogs.sort_by { |b| b[:date] }.reverse
  end

  # This parses all the blogs in order to get the most recent
  # Should performance become a problem, consider having the date in the filename, for faster sorting
  def latest_blog
    blogs_by_date_desc[0]
  end
end

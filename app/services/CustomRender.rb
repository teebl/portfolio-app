require "rouge"
require "rouge/plugins/redcarpet"


class CustomRender < Redcarpet::Render::HTML
  include ActionView::Helpers::AssetUrlHelper
  include Propshaft::Helper
  include Rouge::Plugins::Redcarpet

  def initialize(extensions = {})
    super extensions.merge(
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: "nofollow", target: "_blank" }
    )
  end

  def image(path, subtitle, title)
    %(
      <figure>
        <img src="#{path_to_image(path)}" alt="#{title}"/>
        <figcaption>#{subtitle}</figcaption>
      </figure>
    )
  end
end

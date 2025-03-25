class CustomRender < Redcarpet::Render::HTML
  include ActionView::Helpers::AssetUrlHelper
  include Propshaft::Helper

  def image(path, subtitle, title)
    %(
      <figure>
        <img src="#{path_to_image(path)}" alt="#{title}"/>
        <figcaption>#{subtitle}</figcaption>
      </figure>
    )
  end
end

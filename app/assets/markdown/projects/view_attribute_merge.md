---
title: Making Rails Views Easier with a custom gem
summary: merging HTML attributes in rails can be a pain. This gem makes it easier.
date: 2024-05-08
---

## [check it out >>>](https://github.com/teebl/view_attribute_merge) 

This is a specialized Ruby gem that solves the frustrating problem of merging HTML attributes in Rails applications. Unlike standard Ruby hash merging, ViewAttributeMerge understands the unique requirements of HTML attributes, particularly when working with Stimulus.js and CSS classes.

## key features

- **Smart Stimulus.js Support**: Properly merges `data-controller`, `data-action`, and target attributes according to Stimulus conventions
- **CSS Class Handling**: Intelligently combines class lists while preserving order and removing duplicates
- **Attribute Precedence**: Maintains proper override behavior while respecting special attribute merging rules
- **Lightweight**: Zero dependencies, minimal overhead

## why it matters

Slick Rails front-ends rely heavily on things like Stimulus.js, ViewComponents, and plain-old partials. ViewAttributeMerge eliminates the headache of manually managing attribute merging logic, reducing bugs and making your view code more maintainable.

```ruby
# Simple, intuitive API
ViewAttributeMerge.attr_merge(
  { class: "btn", data: { controller: "modal" } },
  { class: "btn-primary", "data-action": "click->modal#open" }
)
# => {
#      class: ["btn", "btn-primary"],
#      data: {
#        controller: "modal",
#        action: "click->modal#open"
#      }
#    }
```

Perfect for use with ViewComponent, partials, or any Rails view helper that needs clean attribute merging. The gem works particularly well in component-based architectures where attribute inheritance is common.

```ruby
# ViewComponent integration example
class ButtonComponent < ViewComponent::Base
  def initialize(html_attributes: {})
    @attrs = ViewAttributeMerge.attr_merge(
      { class: "btn", data: { controller: "button" } },
      html_attributes
    )
  end
end
```




Whether you're building complex ViewComponent hierarchies or just need cleaner attribute handling in your Rails views, ViewAttributeMerge provides a simple yet powerful solution to a common pain point in Rails development. Give it a try, and feel free to share any feedback :)

## [github repo](https://github.com/teebl/view_attribute_merge)
## [rubygems](https://rubygems.org/gems/view_attribute_merge)

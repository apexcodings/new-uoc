module PagesHelper
  def side_links_for(page)
    content_tag :ul do
      if page.experts?
        links_for_experts
      else
        links_for_page(page)
      end
    end
  end

  def links_for_experts
    Expert::CATEGORIES.map do |c|
      concat(content_tag(:li, link_to(c, experts_path(category: c.parameterize.underscore))))
    end
  end

  def links_for_page(page)
    page.side_nav.map do |p|
      concat(content_tag(:li, link_to(p.title, page_path(p.slug))))
    end
  end
end

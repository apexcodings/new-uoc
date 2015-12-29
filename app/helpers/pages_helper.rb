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

  def side_links_for_experts
    content_tag :ul do
      links_for_experts
    end
  end

  def links_for_experts
    Expert::CATEGORIES.each do |key, value|
      concat(content_tag(:li, link_to(value, experts_path(category: key.to_s))))
    end
  end

  def links_for_page(page)
    page.side_nav.each do |p|
      concat(content_tag(:li, link_to(p.title, page_path(p.slug))))
    end
  end
end

module ExpertsHelper
  def side_links_for_experts(category=nil)
    links = []
    Expert::CATEGORIES.each do |key, value|
      if category && category == value
        links << link_to(value, experts_path(category: key.to_s), class: "side-active")
      else
        links << link_to(value, experts_path(category: key.to_s))
      end
    end

    content_tag :ul do
      links.each do |link|
        concat(content_tag(:li, link))
      end
    end
  end

  def links_for_experts
    Expert::CATEGORIES.each do |key, value|
      concat(content_tag(:li, link_to(value, experts_path(category: key.to_s))))
    end
  end

  def admin_image_for_expert(expert)
    if expert.image_url.present?
      link_to(image_tag(expert.image_url, class: "expert-thumb"), expert)
    else
      image_tag "expert_default.png", class: "expert-thumb"
    end
  end
end

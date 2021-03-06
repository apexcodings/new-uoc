module PagesHelper
  def side_links_for(page)
    content_tag :ul do
      case
      when page.experts?
        links_for_experts
      when page.in_portal?
        portal_links_in_list
      else
        links_for_page(page)
      end
    end
  end

  def portal_links
    Page.portal_pages.map do |p|
      link_to_unless_current p.title, page_path(p) do
        link_to p.title, page_path(p), class: "side-active"
      end
    end
  end

  def portal_links_in_list
    portal_links.each do |link|
      concat(content_tag(:li, link))
    end
  end

  def links_for_page(page)
    page.side_nav.each do |sibling|
      concat(content_tag(:li, link(sibling)))
      if (sibling == page || sibling == page.parent) && sibling.has_children?
        sibling.children.order(:position).each do |c|
          concat(content_tag(:li, sublink(c)))
        end
      end
    end
  end

  def link(page)
    if page.redirect_url?
      link_to page.label, page.redirect_url
    elsif page.has_children?
      link_to_unless_current page.label, page_path(page.slug), class: "with-children" do
        link_to page.label, "#", class: "side-active with-children-open"
      end
    else
      link_to_unless_current page.label, page_path(page.slug) do
        link_to page.label, "#", class: "side-active"
      end
    end
  end

  def sublink(page)
    if page.redirect_url?
      link_to page.label, page.redirect_url, class: 'sub-page'
    else
      link_to_unless_current page.label, page_path(page.slug), class: "sub-page" do
        link_to page.label, "#", class: "sub-page-active"
      end
    end
  end

#  def top_link_for(title, page)
#    if page && page.root.slug == title.parameterize
#      link_to title, page_path(title.parameterize), class: "top-active"
#    else
#      link_to_unless_current title, page_path(title.parameterize) do
#        link_to title, "#", class: "top-active"
#      end
#    end
#  end

  def top_link_for(label, page)
    if page && page.root.slug == label.parameterize
      link_to label, page_path(label.parameterize), class: "top-active"
    else
      link_to_unless_current label, page_path(label.parameterize) do
        link_to label, "#", class: "top-active"
      end
    end
  end

  def page_partial(page)
    if FileTest.exist?(Rails.root.join('app', 'views', 'pages', "_#{page.slug.gsub(/-/, "_")}.html.erb"))
      render "pages/#{page.slug.gsub(/-/, "_")}"
    end
  end

  def heading_for(page)
    case
    when page.sports_medicine_subpage?
      content_tag(:h1, page.title, class: "map-page roboto")
    when page.in_portal?
      content_tag(:h1, page.title, class: "map-page roboto")
    when page.in_surgical?
      content_tag(:h1, page.title, class: "map-page roboto")
    when page.with_map?
      content_tag(:h1, page.title, class: "map-page roboto")
    else
      content_tag :div do
        concat(image_for page)
        concat(content_tag(:h1, page.title, class: "map-page roboto"))
      end
    end
  end

#  def image_for(page)
#    if page.image_url.nil?
#      image_tag page.root.image_url
#    else
#      image_tag page.image_url
#    end
#  end

  def image_for(page)
    if page.main_image.exists?
      image_tag page.main_image.url
    else
      image_tag page.root.main_image.url
    end
  end

  def start_background_for(page)
    if page
      case
      when page.in_sports?
        return "<div class='site bg_sports'>".html_safe
      when page.in_services?
        return "<div class='site bg_services'>".html_safe
      when page.slug == "our-experts"
        return "<div class='site bg_experts'>".html_safe
      end
    else
      if controller_name == "experts"
        return "<div class='site bg_experts'>".html_safe
      end
    end

    "<div class='site bg_default'>".html_safe
  end

  def side_header_for(page)
    case
    when page.in_portal?
      content_tag(:h2, "Patient Portal", class: "roboto")
    else
      content_tag(:h2, link_to(page.root.label, page.root, class: "roboto"))
    end
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS|Silk|LG-V410/
  end

end

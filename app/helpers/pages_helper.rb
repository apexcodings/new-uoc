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
        sibling.children.each do |c|
          concat(content_tag(:li, sublink(c)))
        end
      end
    end
  end


  def link(page)
    link_to_unless_current page.title, page_path(page.slug) do
      link_to page.title, "#", class: "side-active"
    end
  end

  def sublink(page)
    link_to_unless_current page.title, page_path(page.slug), class: "sub-page" do
      link_to page.title, "#", class: "sub-page-active"
    end
  end

  def top_link_for(title, page)
    if page && page.root.slug == title.parameterize
      link_to title, page_path(title.parameterize), class: "top-active"
    else
      link_to_unless_current title, page_path(title.parameterize) do
        link_to title, "#", class: "top-active"
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
    when page.sports_medicine?
      content_tag(:h1, page.title, class: "map-page roboto")
    when page.in_portal?
      content_tag(:h1, page.title, class: "map-page roboto")
    when page.with_map?
      content_tag(:h1, page.title, class: "map-page roboto")
    else
      content_tag :div do
        concat(image_tag "service_photo.jpg")
        concat(content_tag(:h1, page.title, class: "roboto"))
      end
    end
  end

  def background_for(page)
    if page && page.sports_medicine?
      sports_background.html_safe
    else
      "<div class='site'>".html_safe
    end
  end

  def sports_background
    "<div class='site' style='background-image: url(https://s3.amazonaws.com/com.uocproduction/images/soccerGirl2.png), url(https://s3.amazonaws.com/com.uocproduction/images/baseballPitcher2.png), linear-gradient(white, gray);'>"
  end
end

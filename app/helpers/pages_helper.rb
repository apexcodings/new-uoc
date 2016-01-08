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

# Original
#  def links_for_page(page)
#    page.side_nav.each do |p|
#      concat(content_tag(:li, link(p)))
#    end
#  end

# First try
#  def links_for_page(page)
#    page.side_nav.each do |p|
#      if p.is_a?(Hash)
#        concat(content_tag(:li, link(p.keys.first)))
#        p[p.keys.first].each do |c|
#          concat(content_tag(:li, sublink(c)))
#        end
#      else
#        concat(content_tag(:li, link(p)))
#      end
#    end
#  end

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
    when current_page?(page_path("sports-medicine-services"))
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
    if current_page?(page_path("sports-medicine-services"))
      sports_background.html_safe
    else
      "<div class='site'>".html_safe
    end
  end

  def sports_background
    "<div class='site' style='background-image: url(https://s3.amazonaws.com/com.uocproduction/images/soccerGirl.png), url(https://s3.amazonaws.com/com.uocproduction/images/baseballPitcher.png), linear-gradient(white, gray);'>"
  end
end

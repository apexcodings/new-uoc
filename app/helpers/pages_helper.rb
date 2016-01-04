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



  def links_for_page(page)
    page.side_nav.each do |p|
      concat(content_tag(:li, link(p)))
    end
  end

  def link(page)
    link_to_unless_current page.title, page_path(page.slug) do
      link_to page.title, "#", class: "side-active"
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

end

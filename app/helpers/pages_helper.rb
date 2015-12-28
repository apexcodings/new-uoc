module PagesHelper
  def side_links_for(page)
    content_tag :ul do

      if page.experts?
        Expert::CATEGORIES.collect do |name|
          concat(content_tag(:li, link_to(name, experts_path(category: name.parameterize.underscore))))
        end
      else
        page.side_nav.collect do |c|
          concat(content_tag(:li, link_to(c.title, page_path(c.slug))))
        end
      end

    end
  end
end

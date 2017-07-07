module NewsReleasesHelper
  def recent_news
    content_tag :ul, class: "news-side-list" do
      NewsRelease.published.recent.each do |news|
        concat(content_tag(:li, link_to(news.title, news)))
      end
    end
  end

  def published_label_for(release)
    if release.published?
      content_tag(:span, 'Published', class: 'admin-label green')
    else
      content_tag(:span, 'Unpublished', class: 'admin-label yellow')
    end
  end
end

module NewsReleasesHelper
  def recent_news
    content_tag :ul, class: "news-side-list" do
      NewsRelease.recent.each do |news|
        concat(content_tag(:li, link_to(news.title, news)))
      end
    end
  end
end

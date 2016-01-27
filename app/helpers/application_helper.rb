module ApplicationHelper
  def page_title
    if content_for?(:title)
      "UOC: #{content_for :title}"
    else
      "UOC: Central Pennsylvania Experts in General Orthopedics, Sports Medicine, Chiropractic Care, Pain Management and Joint Replacement Care"
    end
  end

  def page_description
    if content_for?(:description)
      content_tag(:meta, nil, name: "description", content: content_for(:description))
    end
  end

  def page_keywords
    if content_for?(:keywords)
      content_tag(:meta, nil, name: "keywords", content: content_for(:keywords))
    end
  end
end

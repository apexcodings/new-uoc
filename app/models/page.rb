class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  has_ancestry

  def generate_slug
    self.slug ||= title.parameterize if title
  end

  def to_param
    slug
  end

#  def side_nav
#    #root.children.order(:position)
#
#    returned_pages = []
#
#    root.children.order(:position).each do |page|
#      if page.has_children?
#        subpages = []
#        page.children.each do |c|
#          subpages << c
#        end
#        returned_pages << { page => subpages }
#      else
#        returned_pages << page
#      end
#    end
#
#    returned_pages
#  end

  def side_nav
    root.children.order(:position)
  end

  def experts?
    slug == "our-experts"
  end

  def sports_medicine?
    if parent && parent.slug == 'sports-medicine-services'
      true
    elsif slug == "sports-medicine-services"
      true
    else
      false
    end
  end

  def sports_medicine_subpage?
    if parent && parent.slug == 'sports-medicine-services'
      true
    else
      false
    end
  end

  PORTAL_PAGES = ["what-is-nextmd", "why-nextmd", "how-nextmd-works", "portal-appointments", "messaging", "faq"]

  def in_portal?
    slug.in? PORTAL_PAGES
  end

  def self.portal_pages
    where(slug: PORTAL_PAGES).order(:position)
  end

  def with_map?
    parent == Page.find_by(slug: "contact-us")
  end
end

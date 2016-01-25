class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug
  before_validation :generate_label

  has_ancestry

  def generate_slug
    self.slug ||= title.parameterize if title
  end

  def generate_label
    self.label ||= title if title
  end

  def to_param
    slug
  end

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

  SURGICAL_PAGES = ["uocss", "adv-center-for-surgery"]

  SPECIALTIES_PAGES = ["neck-back", "shoulders", "elbows", "hands-wrists", "hips", "knees", "feet-ankles"]

  def in_surgical?
    slug.in? SURGICAL_PAGES
  end

  def in_specialties?
    # this is a temporary thing, until they have the top images
    slug.in? SPECIALTIES_PAGES
  end

  def in_portal?
    slug.in? PORTAL_PAGES
  end

  def self.portal_pages
    where(slug: PORTAL_PAGES).order(:position)
  end

  def in_patient_resources?
    case
    when parent
      parent.slug == "patient-resources" || root.slug == "patient-resources"
    when slug == "patient-resources"
      true
    else
      false
    end
  end

  def with_map?
    if parent
      parent.slug == "contact-us" || root.slug == "contact-us"
    end
  end

  def self.sports
    Page.find_by(slug: "sports-medicine-services")
  end

  def in_sports?
    sports_page = Page.sports
    if self == sports_page || sports_page.children.include?(self)
      true
    else
      false
    end
  end

  def self.services
    Page.find_by(slug: "services")
  end

  def in_services?
    services_page = Page.services
    services_descendants = services_page.descendants.reject { |p| p.in_sports? }
    if self == services_page || services_descendants.include?(self)
      true
    else
      false
    end
  end
end

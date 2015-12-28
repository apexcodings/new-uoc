class Page < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  has_ancestry

  def generate_slug
    self.slug ||= title.parameterize if title
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
end

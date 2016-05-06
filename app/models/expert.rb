class Expert < ActiveRecord::Base
  validates :first_name, :last_name, :category, presence: true

  CATEGORIES = { physicians: "Physicians", 
                 physicians_assistants: "Physicians Assistants", 
                 physical_therapists: "Physical Therapists", 
                 clinical_researchers: "Clinical Researchers", 
                 workers_comp: "Worker's Compensation Representative", 
                 athletic_trainers: "Athletic Trainers",
                 joint_replacement: "Joint Replacement Coordinator"
                 }
                  #management: "Management"

  validates :category, inclusion: { in: CATEGORIES.keys.map { |c| c.to_s } }

  has_attached_file :photo,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml", 
    :path => ":attachment/:id/:style.:extension",
    :url => ":s3_domain_url"

  validates_attachment :photo,
    :content_type => { :content_type => ['image/jpeg', 'image/png'] },
    :size => { :less_than => 0.1.megabytes }

  #scope :by_category, ->(category) { where(category: category).order(:position) }
  scope :by_category, ->(category) do 
    if category.in? ["clinical_researchers", "workers_comp", "management"]
      where(category: category).order(:position) 
    else
      where(category: category).order(:last_name) 
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def formatted_location
    if location.empty?
      ""
    else
      main_location = location.split(/&|,/).first
      other_locations = location.gsub(main_location, '')
      "<b>#{main_location}</b> #{other_locations}"
    end
  end

end

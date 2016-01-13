class Expert < ActiveRecord::Base
  validates :first_name, :last_name, :location, :category, presence: true

  CATEGORIES = { physicians: "Physicians", 
                 physicians_assistants: "Physicians Assistants", 
                 physical_therapists: "Physical Therapists", 
                 clinical_researchers: "Clinical Researchers", 
                 workers_comp: "Worker's Compensation Representative", 
                 athletic_trainers: "Athletic Trainers", 
                 management: "Management"}

  validates :category, inclusion: { in: CATEGORIES.keys.map { |c| c.to_s } }

  scope :by_category, ->(category) { where(category: category).order(:last_name) }

  def name
    "#{first_name} #{last_name}"
  end

end

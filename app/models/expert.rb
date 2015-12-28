class Expert < ActiveRecord::Base
  validates :name, :phone, :location, :specialty, :procedures, :education, :category, presence: true

  CATEGORIES = ["Physicians", "Physicians Assistants", "Physical Therapists", "Clinical Researchers", "Worker's Comp Rep", "Athletic Trainers", "Management"]

  validates :category, inclusion: { in: CATEGORIES.map { |c| c.parameterize.underscore } }

end

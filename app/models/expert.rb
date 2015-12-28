class Expert < ActiveRecord::Base
  validates :name, :phone, :location, :specialty, :procedures, :education, :category, presence: true

  CATEGORIES = %w(physicians physicians_assistants physical_therapists clinical_researchers workers_comp athletic_trainers management)

  validates :category, inclusion: { in: CATEGORIES }

end

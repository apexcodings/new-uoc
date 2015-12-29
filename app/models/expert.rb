class Expert < ActiveRecord::Base
  validates :name, :phone, :location, :specialty, :procedures, :education, :category, presence: true

  CATEGORIES = { physicians: "Physicians", 
                 physicians_assistants: "Physicians Assistants", 
                 physical_therapists: "Physical Therapists", 
                 clinical_researchers: "Clinical Researchers", 
                 workers_comp: "Worker's Comp Rep", 
                 athletic_trainers: "Athletic Trainers", 
                 management: "Management"}

  validates :category, inclusion: { in: CATEGORIES.keys.map { |c| c.to_s } }


end

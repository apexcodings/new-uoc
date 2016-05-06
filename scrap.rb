trials = Page.find_by(slug: "clinical-trials")
trials.children.create!(title: "State College", slug: "trials-state-college")
trials.children.create!(title: "Altoona (Fairway Drive)", slug: "trials-altoona-fairway")
trials.children.create!(title: "Altoona (Station Medical)", slug: "trials-altoona-station")

expert = Expert.create!( first_name: "Tara",
                          last_name: "McCaulley",
                          suffix: "RN",
                          phone: "(814) 949-4050 ext 1314",
                          location: "State College, Altoona, Grays Woods",
                          specialty: "Total Joint Replacement",
                          category: "joint_replacement")




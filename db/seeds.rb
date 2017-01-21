
5.times do |index|
  project = Project.create!(name: "Cabify#{index}", 
                            description: "Description#{index}")
  2.times do |index2|
    project.time_entries.create(hours: index2,
                                minutes: index*index2,
                                date: Date.today,
                                comments: "Comment#{index2}")
  end
end

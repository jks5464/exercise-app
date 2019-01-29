# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

units = [{"name": "lbs", "category": "Strength"},
         {"name": "kgs", "category": "Strength"},
         {"name": "meters", "category": "Cardio"},
         {"name": "miles", "category": "Cardio"},
         {"name": "minutes", "category": "Cardio"},
         {"name": "hours", "category": "Cardio"},
         {"name": "seconds", "category": "Cardio"}
         ]

exercises = [   {"name": "Bench Press", "category": "Strength", "description": "Strength exercise to build your chest.",   "user_id": "1"},
                {"name": "Squat",       "category": "Strength", "description": "Strength exercise to build your glutes.",  "user_id": "1"}]

units.each do |unit|
    Unit.create(unit)
end

exercises.each do |exercise|
    Exercise.create(exercise)
end

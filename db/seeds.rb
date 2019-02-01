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

units.each do |unit|
    Unit.create(unit)
end




workouts = [{"name": "Abs", "user_id": "1", "completed": "true", "uid": "0"},
            {"name": "Legs", "user_id": "0", "completed": "true", "uid": "1"}
            ]

workouts.each do |workout|
    tmp = Workout.create(workout)
    
    t_tmp = Task.create("exercise_id": "1", "completed": "true", "workout_id": tmp.id)
    t_tmp2 = Task.create("exercise_id": "2", "completed": "true", "workout_id": tmp.id)
    
    ExerciseSet.create("rep_count": "25", "rep_value": "30", "rep_unit": "lbs", "completed": "true", "task_id": t_tmp.id)
    ExerciseSet.create("rep_count": "10", "rep_value": "50", "rep_unit": "lbs", "completed": "false", "task_id": t_tmp2.id)
    
end
                
exercises = [   {"name": "Bench Press", "category": "Strength", "description": "Strength exercise to build your chest.",   "user_id": "1"},
                {"name": "Squat",       "category": "Strength", "description": "Strength exercise to build your glutes.",  "user_id": "1"},
                {"name": "Run",         "category": "Cardio",   "description": "Cardio exercise that no one enjoys",       "user_id": "1"}]
exercises.each do |exercise|
    Exercise.create(exercise)
end


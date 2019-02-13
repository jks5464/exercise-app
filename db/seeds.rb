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




workouts = [{"name": "Abs", "user_id": "1", "state": State.saved, "uid": "0"},
            {"name": "Legs", "user_id": "0", "state": State.saved, "uid": "1"}
            ]

workouts.each do |workout|
    tmp = Workout.create(workout)
    
    t_tmp = Task.create("exercise_id": "1", "state": State.saved, "workout_id": tmp.id)
    t_tmp2 = Task.create("exercise_id": "2", "state": State.saved, "workout_id": tmp.id)
    
    ExerciseSet.create("rep_count": "25", "rep_value": "30", "rep_unit": "lbs", "state": State.saved, "task_id": t_tmp.id)
    ExerciseSet.create("rep_count": "10", "rep_value": "50", "rep_unit": "lbs", "state": State.saved, "task_id": t_tmp2.id)
    
end
                
exercises = [   {"name": "Bench Press", "category": "Strength", "description": "Strength exercise to build your chest.",   "user_id": "1"},
                {"name": "Squat",       "category": "Strength", "description": "Strength exercise to build your glutes.",  "user_id": "1"},
                {"name": "Run",         "category": "Cardio",   "description": "Cardio exercise that no one enjoys",       "user_id": "1"}]
exercises.each do |exercise|
    Exercise.create(exercise)
end

# # Development seed data
# if Rails.env.development? then
#     users = [ {"provider" => "none", "uid" => "-1", "name" => "Client_1_id_1", "oauth_token" => "none", "oauth_expires_at" => "January 1, 1753"},
#               {"provider" => "none", "uid" => "-1", "name" => "Client_2_id_2", "oauth_token" => "none", "oauth_expires_at" => "January 1, 1753"},
#               {"provider" => "none", "uid" => "-1", "name" => "Client_3_id_3", "oauth_token" => "none", "oauth_expires_at" => "January 1, 1753"},
#               {"provider" => "none", "uid" => "-1", "name" => "Trainer_1_id_4", "oauth_token" => "none", "oauth_expires_at" => "January 1, 1753"},
#               {"provider" => "none", "uid" => "-1", "name" => "Trainer_2_id_5", "oauth_token" => "none", "oauth_expires_at" => "January 1, 1753"}]
    
#     users.each do | user |
#         User.create(user)
#     end
    
#     client_trainer_relations = [ {"client_id" => 1, "trainer_id" => 4},
#                                 {"client_id" => 2, "trainer_id" => 4},
#                                 {"client_id" => 3, "trainer_id" => 4},
#                                 {"client_id" => 1, "trainer_id" => 5}]
                                
#     client_trainer_relations.each do |relation|
#         ClientTrainerRelation.create(relation)
#     end
# end
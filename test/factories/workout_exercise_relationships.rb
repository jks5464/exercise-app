FactoryBot.define do
  factory :workout_exercise_relationship do
    workout_id { "MyString" }
    exercise_id { "MyString" }
    sets { 1 }
    reps { 1 }
  end
end

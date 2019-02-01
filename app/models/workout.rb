class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :task
  
  def self.insert_new_workout(user, workout_name, task_card_data, workout_completed, task_completed, sets_completed)
    new_workout = user.workout.create(name: workout_name, uid: 0, completed: workout_completed)
    task_card_data.each do | i, td |
      exercise = Exercise.get_by_name(td['exercise_name'])
      new_task = new_workout.task.create(exercise_id: exercise.id, completed: task_completed)
      (1..td["set_count"].to_i).each do | i |
        new_task.exercise_set.create(rep_count: td["rep_count"], rep_value: td["rep_value"], rep_unit: td["rep_unit"], completed: sets_completed)
      end
    end
  end
end

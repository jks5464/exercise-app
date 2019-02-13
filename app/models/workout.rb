class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :task
  
  def self.insert_new_workout(user, workout_name, task_card_data, workout_state, task_state, sets_state)
    new_workout = user.workout.create(name: workout_name, uid: 0, state: workout_state)
    task_card_data.each do | i, td |
      exercise = Exercise.get_by_name(td['exercise_name'])
      new_task = new_workout.task.create(exercise_id: exercise.id, state: task_state)
      (1..td["set_count"].to_i).each do | i |
        new_task.exercise_set.create(rep_count: td["rep_count"], rep_value: td["rep_value"], rep_unit: td["rep_unit"], state: sets_state)
      end
    end
  end
  
  def self.update_state(id, new_state)
    # mark all workouts and its related tasks and its related sets states' as 'new_state'
    workout = where(id: id).first
    workout.update(state: new_state)
    
    workout.task.each do | task |
      task.update(state: new_state)
      task.exercise_set.each do | set |
        set.update(state: new_state)
      end
    end
  end
  
  def self.clone(user, base_workout_id)
    base_workout = find(base_workout_id)
    clone_workout = user.workout.create(name: base_workout.name, uid: 0, state: base_workout.state)
    base_workout.task.each do |base_task|
      clone_task = clone_workout.task.create(exercise_id: base_task.exercise_id, state: base_task.state)
      base_task.exercise_set.each do | base_set |
        clone_task.exercise_set.create(rep_count: base_set.rep_count, rep_value: base_set.rep_value, rep_unit: base_set.rep_unit, state: base_set.state)
      end
    end
    return clone_workout.id
  end
end

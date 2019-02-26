class ExerciseSet < ActiveRecord::Base
    belongs_to :task
    
    def self.update_exercise_set(exercise_set_id, rep_count, rep_value)
        exercise_set = find(exercise_set_id)
        exercise_set.update(rep_count: rep_count, rep_value: rep_value)
    end
end

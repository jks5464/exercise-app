class CreateWorkoutExerciseRelationships < ActiveRecord::Migration
  def change
    create_table :workout_exercise_relationships do |t|
      t.string :workout_id
      t.string :exercise_id
      t.integer :sets
      t.integer :reps

      t.timestamps null: false
    end
  end
end

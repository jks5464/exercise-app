class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :rep_count
      t.integer :rep_value
      t.string :rep_unit

      t.timestamps null: false
    end
  end
end

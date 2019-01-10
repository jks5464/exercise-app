class AddingRelations < ActiveRecord::Migration
  def change
    
    # Exercise_Sets
    add_reference :exercise_sets, :task, index: true
    add_column :exercise_sets, :completed, :boolean
    
    # Exercise
    remove_column :exercises, :uid, :string
    add_reference :exercises, :user, index: true
    
    # Goals
    add_reference :goals, :user, index: true
    add_reference :goals, :exercise, index: true
    add_reference :goals, :unit, index: true
    
    # Measurements
    remove_column :measurements, :uid, :string
    add_reference :measurements, :user, index: true
    
    # Tasks
    add_reference :tasks, :exercise, index: true
    add_reference :tasks, :workout, index: true
    add_column :tasks, :completed, :boolean
    
    # Workouts
    add_reference :workouts, :user, index: true
    add_column :workouts, :completed, :boolean
  end
end

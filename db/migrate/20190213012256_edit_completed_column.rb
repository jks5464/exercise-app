class EditCompletedColumn < ActiveRecord::Migration
  def change
    remove_column :exercise_sets, :completed, :boolean
    add_column :exercise_sets, :state, :string
    
    remove_column :tasks, :completed, :boolean
    add_column :tasks, :state, :string
    
    remove_column :workouts, :completed, :boolean
    add_column :workouts, :state, :string
  end
end

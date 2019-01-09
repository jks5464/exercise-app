class AddUidToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :uid, :string
  end
end

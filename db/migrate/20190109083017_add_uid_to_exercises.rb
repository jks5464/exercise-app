class AddUidToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :uid, :string
  end
end

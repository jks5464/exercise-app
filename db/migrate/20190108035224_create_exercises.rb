class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.string :muscle_group
      t.string :category

      t.timestamps null: false
    end
  end
end

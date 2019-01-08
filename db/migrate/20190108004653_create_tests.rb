class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end

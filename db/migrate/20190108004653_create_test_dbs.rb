class CreateTestDBs < ActiveRecord::Migration
  def change
    create_table :test_dbs do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end

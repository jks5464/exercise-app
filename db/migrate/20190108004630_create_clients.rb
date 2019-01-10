class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :weight
      t.string :body_fat
      t.string :height
      t.string :date

      t.timestamps null: false
    end
  end
end

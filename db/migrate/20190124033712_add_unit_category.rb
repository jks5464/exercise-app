class AddUnitCategory < ActiveRecord::Migration
  def change
    add_column :units, :category, :string
  end
end

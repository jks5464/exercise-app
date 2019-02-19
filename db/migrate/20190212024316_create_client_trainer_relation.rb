class CreateClientTrainerRelation < ActiveRecord::Migration
  def change
    create_table :client_trainer_relations do |t|
      t.references :client, references: :user
      t.references :trainer, references: :user
    end
    
    # add_foreign_key :client_trainer_relations, :users, column: :client
    # add_foreign_key :client_trainer_relations, :users, column: :trainer
  end
end

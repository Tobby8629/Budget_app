class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, index: true, null: true, foreign_key:{to_table: :users}
      t.string :name 
      t.integer :amount
      t.timestamps
    end
  end
end

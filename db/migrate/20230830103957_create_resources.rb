class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :amount
      t.integer :difficulty

      t.timestamps
    end
  end
end

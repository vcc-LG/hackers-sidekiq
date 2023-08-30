class CreateSurvivors < ActiveRecord::Migration[7.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :health
      t.integer :stamina
      t.integer :hunger
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

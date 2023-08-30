class CreateZombieHordes < ActiveRecord::Migration[7.0]
  def change
    create_table :zombie_hordes do |t|
      t.string :location
      t.integer :threat_level

      t.timestamps
    end
  end
end

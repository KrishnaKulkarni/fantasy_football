class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.string :name
      t.references :manager, foreign_key: true
      t.json :structure

      t.timestamps
    end
  end
end

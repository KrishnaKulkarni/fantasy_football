class CreateManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :managers do |t|
      t.string :name, unique: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end

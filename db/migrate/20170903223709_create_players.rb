class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :position, index: true
      t.decimal :private_value, precision: 5, scale: 2
      t.decimal :public_value, precision: 5, scale: 2
      t.integer :roster_id, index: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end

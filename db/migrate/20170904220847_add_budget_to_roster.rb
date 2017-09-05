class AddBudgetToRoster < ActiveRecord::Migration[5.0]
  def change
    add_column :rosters, :budget, :integer, default: 200
  end
end

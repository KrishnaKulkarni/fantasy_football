class AddSlotsToRostersAndRemoveStructure < ActiveRecord::Migration[5.0]
  def change
    [:RB,
    :WR,
    :QB,
    :TE,
    :K,
    :DEF].each do |pos|
      add_column :rosters, pos, :integer, default: 0
    end
    remove_column :rosters, :structure
  end
end

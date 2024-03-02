class AddDetailsToDoemus < ActiveRecord::Migration[6.1]
  def change
    add_column :doemus, :overall, :integer
    add_column :doemus, :level, :integer　
  end
end

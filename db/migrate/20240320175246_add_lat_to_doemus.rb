class AddLatToDoemus < ActiveRecord::Migration[6.1]
  def change
    add_column :doemus, :lat, :float
  end
end

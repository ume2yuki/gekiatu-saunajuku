class AddLngToDoemus < ActiveRecord::Migration[6.1]
  def change
    add_column :doemus, :lng, :float
  end
end

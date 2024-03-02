class CreateDoemus < ActiveRecord::Migration[6.1]
  def change
    create_table :doemus do |t|
      t.string :name
      t.string :address
      t.text :about
      t.string :image
      t.string :service
      t.integer :user_id
      t.integer :money
      t.text :access

      t.timestamps
      add_column :doemus, :image, :string
    end
  end
end

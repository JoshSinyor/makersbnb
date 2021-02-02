class CreateSpacesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :space_name, limit: 100
      t.text :description, limit: 1000
      t.integer :price
      t.bigint :user_id
    end
  end
end

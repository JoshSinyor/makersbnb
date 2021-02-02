class UpdatePriceColToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :spaces, :price, :decimal
  end
end

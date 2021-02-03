class AddStartAndEndDates < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :start_date, :string
    add_column :spaces, :end_date, :string
  end
end

class AddNewColumnToUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pfp_url, :string
  end
end

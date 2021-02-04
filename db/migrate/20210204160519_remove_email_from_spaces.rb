class RemoveEmailFromSpaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :spaces, :email

  end
end

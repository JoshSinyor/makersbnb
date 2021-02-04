class ChangeEmailColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_email, :string, unique: true
  end
end

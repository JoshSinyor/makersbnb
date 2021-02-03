class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, limit: 50
      t.string :user_email, limit: 50
      t.string :password_digest
    end
  end
end

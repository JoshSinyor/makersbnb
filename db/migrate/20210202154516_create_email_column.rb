class CreateEmailColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :email, :string
  end
end

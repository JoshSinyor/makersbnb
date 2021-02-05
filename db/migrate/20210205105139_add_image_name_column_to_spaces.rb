class AddImageNameColumnToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :image_name, :string
  end
end

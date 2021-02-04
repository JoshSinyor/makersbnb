class AlterSpacesUseridToForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :spaces, :users
  end
end

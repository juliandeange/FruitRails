class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :type, :Fruit_Type
  end
end

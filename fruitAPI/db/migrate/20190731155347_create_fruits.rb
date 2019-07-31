class CreateFruits < ActiveRecord::Migration[5.2]
  def change
    create_table :fruits do |t|
      t.integer :category_id
      t.text :name

      t.timestamps
    end
  end
end

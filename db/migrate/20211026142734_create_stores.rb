class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :motto
      t.string :product
      t.integer :price

      t.timestamps
    end
  end
end

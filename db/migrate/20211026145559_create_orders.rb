class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :store, null: false, foreign_key: true
      t.integer :total
      t.string :review_title
      t.integer :review_stars
      t.text :review

      t.timestamps
    end
  end
end

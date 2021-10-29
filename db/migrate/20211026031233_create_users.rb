class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password  
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :unit
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end

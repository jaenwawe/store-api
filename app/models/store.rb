class Store < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :users, through: :orders
    
end

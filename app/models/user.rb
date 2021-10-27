class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :stores, through: :orders
    
end

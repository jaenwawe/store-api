class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :stores, through: :orders

    has_secure_password
    
end

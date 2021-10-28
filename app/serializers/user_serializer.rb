class UserSerializer < UserIndexSerializer
  has_many :orders
  has_many :stores

  
  
end

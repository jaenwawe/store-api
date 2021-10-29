class OrderSerializer < OrderIndexSerializer
  has_one :user
  has_one :store  
end

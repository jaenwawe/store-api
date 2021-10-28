class OrderSerializer < OrderIndexSerializer 
  belongs_to :user
  belongs_to :store
end

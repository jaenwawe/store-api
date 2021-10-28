class StoreSerializer < StoreIndexSerializer
  has_many :orders
  has_many :users, through: :orders
  # attributes: :orders, :users
end

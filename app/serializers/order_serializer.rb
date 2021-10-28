class OrderSerializer < OrderIndexSerializer

  belongs_to :user
  belongs_to :store
  

  # def user_name
  #   "#{object.user.username}"
  # end
  

end

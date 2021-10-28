class UserIndexSerializer < ActiveModel::Serializer
  attributes :username, :email



  # def current_order
  #   "#{current_user.orders}"
  # end
  
  #It was showing orders and that disappeared
  #, :orders

  #where does user_orders get defined.

# def orders
#   current_user.orders
# end



# def order
#   current_user.orders.find_by(id: object.id)
# end




  # def user_order
  #   current_user.user_orders.find_by(id: object.id)
  # end
end

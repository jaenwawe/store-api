class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :username, :email


  #where does user_orders get defined.
  def user_order
    current_user.user_orders.find_by(id: object.id)
  end
end

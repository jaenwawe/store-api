class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password

end

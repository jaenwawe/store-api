class UserSerializer < UserIndexSerializer
  has_many :orders
  has_many :stores, through: :orders
  
  
  #attributes :id

  # , :user_exists?
 #   current_user.find_by(email: params[:email])


#     def user_exists?
#       byebug
#       user_username = current_user.find_by(username: params[:username])
#         if !!user_username.include?(user_username)
#           if user_username.password == params[:password]
#               #allow to login
#             render json: #enter
#             if !!User.all.include?(user_email) && current_user.find_by(email: params[:email])
#             else not_found #allow sign up
#             end
#           else not_valid #allow password reset 
#           end
#         else not_found #allow sign up
#       end
#  end      
  
#   private
#   def not_found
#     render json: {error: "Please sign up.  That username is not registered"}
#   end
#   def non_found
#     render json: {error: "Please sign up.  That email address is not registered"}
#   end
#   def not_valid
#     render :json => { :error => "This is an incorrect password for this username.  Please reset your password or signup!"},  :status => :not_found      
#   end
end

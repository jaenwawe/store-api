, :user_can_modify

 
def user_can_modify 
  current_user.admin? || self.object.user == current_user 
  if !user_can_modify
    render json: { error: "You don't have permission to perform that action" }, status: :forbidden
  end
end
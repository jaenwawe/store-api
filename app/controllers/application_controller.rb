class ApplicationController < ActionController::API
   include ActionController::Cookies
  before_action :confirm_authentication


private
    def current_user
      @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
    end

    def confirm_authentication
        if current_user
        render json: {message: "authorized"}
        else
          render json: { error: "You must be logged in to do that." }, status: :unauthorized 
        end
      end

    def authorize
      unless current_user.try(:admin?) || current_user.id == Activity.find_by(id: params[:id]).user_id
        flash[:error] = "You are not authorized to view this page."
        redirect_back(fallback_location: root_path)
      end
    end
    
end

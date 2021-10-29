class SessionsController < ApplicationController
skip_before_action :confirm_authentication, only: [:index, :create, :update, :destroy]
   

    def index
        session[:session_hello] ||= "World"
        cookies[:cookies_hello] ||= "World"
        render json: { session: session, cookies: cookies.to_hash }
    end

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: { error: 'invalid credentials' }, status: :unauthorized
        end
    end


    # class SessionsController < ApplicationController
    #     def create
    #       user = User.find_by(username: params[:username])
    #       session[:user_id] = user.id
    #       render json: user
    #     end
    #   end




    def destroy
        session.delete :user_id
        head :no_content
    end

    def click
        byebug
    end
end
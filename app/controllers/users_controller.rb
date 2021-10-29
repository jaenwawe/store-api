class UsersController < ApplicationController
  skip_before_action :confirm_authentication, only: [:create, :update, :index, :show]
  before_action :set_user, only: [:show, :update, :destroy]
  


  def show
    if current_user
       render json: current_user, status: :ok
    else
      not_found
    end 
  end
  
  
  def create
  new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      render json: new_user, status: :created
    else render json: new_user.errors.full_messages, status: :unprocessable_entity
    end
  end
    
    def update
    set_user
      if @user
      @user.update(user_params)
        if @user.valid?
          @user.save
          render json: @user
        else 
            not_found 
        end
      else        
      render json: {error: "Could not find index #{[:id]}"},  status: :unprocessable_entity 
      end      
    end

  def destroy
    set_user
    if @user
      @user.destroy
      render json: {message: "deleted"}, status: :ok
    else
      render json: {error: "Could not find index #{[:id]}"}
    end
  end
    
      
  def index    
      render json: User.all, each_serializer: UserIndexSerializer  
  end

private
      def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :phone_number, :address, :unit, :state, :zipcode)        
      end
      

      def not_found
        render :json => { :error => "user not found"}, :status => :not_found
          
      end

      def set_user
        @user = User.find(params[:id])
      end
    
    end
    

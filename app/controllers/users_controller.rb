class UsersController < ApplicationController
    def index
        users=User.all
        render json: users  
      end


      def show
        found_user = User.find_by(id: params[:id])
        if !!found_user
              render json: found_user.to_json(:except => [:created_at,:updated_at])
        else 
          not_found
        end
      end
    
      def create
        new_user = User.new(user_params)
        if new_user.save
          render json: new_user
        else render json: new_user.errors.full_messages, status: :unprocessable_entity
        end
      end
    
      def update
    
      user_to_update = User.find_by(id: params[:id])
          if !!user_to_update
            user_to_update.update(user_params)
            if user_to_update.valid?
              user_to_update.save
              render json: user_to_update
            else not_found
            end
          else        
            render json: {error: "Could not find index #{[:id]}"},  status: :unprocessable_entity 
            end      
        end
    
      def destroy
        user_to_delete = User.find_by(id: params[:id])
        if user_to_delete
          user_to_delete.destroy
          render json: {message: "deleted"}, status: :ok
        else
          render json: {error: "Could not find index #{[:id]}"}
        end
      end
    
      
private
#maybe serializer to limit params during update
       def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :phone_number, :address, :unit, :state, :zipcode
        )        
      end




      def not_found
        render :json => { :error => "user not found"}, :status => :not_found
          
      end
    
    
    end
    

class OrdersController < ApplicationController

    def index
        orders=Order.all
        render json: orders  
      end


      def show
        found_order = Order.find_by(id: params[:id])
        if !!found_order
              render json: found_order.to_json(:except => [:created_at,:updated_at])
        else 
          not_found
        end
      end
    
      def create
        new_order = Order.new(order_params)
        if new_order.save
          render json: new_order
        else render json: new_order.errors.full_messages, status: :unprocessable_entity
        end
      end
    
      def update
    
      order_to_update = Order.find_by(id: params[:id])
          if !!order_to_update
            order_to_update.update(order_params)
            if order_to_update.valid?
              order_to_update.save
              render json: order_to_update
            else not_found
            end
          else        
            render json: {error: "Could not find index #{[:id]}"},  status: :unprocessable_entity 
            end      
        end
    
      def destroy
        order_to_delete = Order.find_by(id: params[:id])
        if order_to_delete
          order_to_delete.destroy
          render json: {message: "deleted"}, status: :ok
        else
          render json: {error: "Could not find index #{[:id]}"}
        end
      end
    
      
private
#maybe serializer to limit params during update
       def order_params
        params.permit(:user_id, :store_id, :total, :review_title, :review_stars, :review)
        
      end

      def not_found
        render :json => { :error => "Order not found"}, :status => :not_found
          
      end
    
    
    end
    

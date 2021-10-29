class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  skip_before_action :confirm_authentication
  #before_action :authorize_user, only:[:index, :show, :update, :destroy]

    def index
      render json: Order.all, each_serializer: OrderIndexSerializer
    end

      def show
        set_order
          if @order  
          render json: @order
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
        set_order
        if @order  
        @order.update(update_order_params)
            if @order.valid?
              @order.save
              render json: @order
            else not_found        
            render json: {error: "Could not find index #{[:id]}"},  status: :unprocessable_entity 
            end      
        end
      end
    
      def destroy
        set_order
        if @order
          @order.destroy
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

      def update_order_params
        params.permit(:review_title, :review_stars, :review)
        
      end

      def not_found
        render :json => { :error => "Order not found"}, :status => :not_found
          
      end

      def set_order
        @order = Order.find(params[:id])
      end

      def authorize_user
        user_can_modify = current_user.admin? || @order.user == current_user 
      if !user_can_modify
        render json: { error: "You don't have permission to perform that action" }, status: :forbidden
      end
    
    
    end
  end
    

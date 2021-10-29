class StoresController < ApplicationController
before_action :set_store, only: [:show, :update, :destroy]
  #skip_before_action :confirm_authentication, only: [:index, :show]
skip_before_action :confirm_authentication

  def index
    render json: Store.all, each_serializer: StoreIndexSerializer    
  end

  def show
    found_store = Store.find_by(id: params[:id])
    if !!found_store
          render json: found_store, each_serializer: StoreSerializer  
    else 
      not_found
    end
  end
    
  def create
    new_store = Store.new(store_params)
    if new_store.save
      render json: new_store, status: :ok
    else render json: new_store.errors.full_messages, status: :unprocessable_entity
    end
  end
    
  def update
  store_to_update = Store.find_by(id: params[:id])
      if !!store_to_update
        store_to_update.update(store_params)
        if store_to_update.valid?
          store_to_update.save
          render json: store_to_update
        else not_found
        end
      else        
        render json: {error: "Could not find index #{[:id]}"},  status: :unprocessable_entity 
        end      
    end
        
    def destroy
      store_to_delete = Store.find_by(id: params[:id])
      if store_to_delete
        store_to_delete.destroy
        render json: {message: "deleted"}, status: :ok
      else
        render json: {error: "Could not find index #{[:id]}"}
      end
    end
        
private

  def store_params
    params.permit(:name, :motto, :product, :price)     
  end
  
  def not_found
    render :json => { :error => "store not found"}, :status => :not_found              
  end

  def set_store
    @store = Store.find(params[:id]) 
  end

end
      
    
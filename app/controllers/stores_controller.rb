    class StoresController < ApplicationController

        def index
            stores=Store.all
            render json: stores, each_serializer: StoreSerializer    
          end
    
    
          def show
            found_store = Store.find_by(id: params[:id])
            if !!found_store
                  render json: found_store.to_json(:except => [:created_at,:updated_at])
            else 
              not_found
            end
          end
        
          def create
            new_store = Store.new(store_params)
            if new_store.save
              render json: new_store
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
    #maybe serializer to limit params during update
           def store_params
            params.permit(:name, :motto, :product, :price)
            
          end


          
    
          def not_found
            render :json => { :error => "store not found"}, :status => :not_found
              
          end
        
        
        end
        
    
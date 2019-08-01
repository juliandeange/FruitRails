class FruitController < ApplicationController

    ## Catch RecordNotFound
    rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: {status: "ERROR", message: "Id of #{params[:id]} not found"}
      end

    ## CRUD

    #Read
    def index
        # fruits = Fruit.all.where(:name => ["strawberry", "blackberry"])
        fruits = Fruit.all.where(:category_id => params[:category_id])
        render json: {status: "SUCCESS", message: "Loaded fruits...", data:fruits}, status: :ok
    end

    def show 
        if params[:category_id]
            fruit = Fruit.where(:category_id => params[:category_id], :id => params[:id])
        else
            fruit = Fruit.find(params[:id])
        end
        render json: {status: "SUCCESS", message: "Loaded fruit...", data:fruit}, status: :ok
    end

    #Create
    def create
        fruit = Fruit.create(fruit_params)
        fruit.category_id = params[:category_id]
        if fruit.save
            render json: {status: "SUCCESS", message: "Fruit created...", data:fruit},status: :ok
        else
            render json: {status: "ERROR", message: "Fruit not created...", data:fruit},status: :unprocessable_entity
        end
    end

    #Delete
    def destroy
        Fruit.find(params[:id]).destroy
        render json: {status: "SUCCESS", message: "Fruit deleted..."},status: :ok
    end

    #Update
    def update

        fruit = Fruit.find(params[:id])

        if fruit.update_attributes(fruit_params)
            render json: {status: "SUCCESS", message: "Fruit updated...", data:fruit},status: :ok
        else
            render json: {status: "ERROR", message: "Fruit not updated...", data:fruit},status: :ok
        end
    end

    private
    def fruit_params
        params.permit(:name)
    end

end

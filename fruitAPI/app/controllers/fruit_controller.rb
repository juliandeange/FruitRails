class FruitController < ApplicationController

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

    def create
    end

end

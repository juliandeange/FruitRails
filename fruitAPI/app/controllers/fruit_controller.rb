class FruitController < ApplicationController

    def index 
        fruits = Fruit.all
        render json: {status: "SUCCESS", message: "Loaded Fruits", data:fruits}, status: :ok
    end

end

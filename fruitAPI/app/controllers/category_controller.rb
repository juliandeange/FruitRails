class CategoryController < ApplicationController

    ## CRUD

    #Read
    def index 
        categories = Category.all
        render json: {status: "SUCCESS", message: "Categories loaded...", data:categories},status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: {status: "SUCCESS", message: "Category loaded...", data:category},status: :ok
    end

    #Create
    def create
        category = Category.new(category_params)
        if category.save
            render json: {status: "SUCCESS", message: "Category created...", data:category},status: :ok
        else
            render json: {status: "ERROR", message: "Category not created...", data:category},status: :unprocessable_entity
        end
    end

    #Delete
    def destroy
        Category.find(params[:id]).destroy
        render json: {status: "SUCCESS", message: "Category deleted..."},status: :ok
    end

    #Update
    def update
        category = Category.find(params[:id])
        if category.update_attributes(category_params)
            render json: {status: 'SUCCESS', message: 'Category updated...', data:category}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Category not updated...', data:category}, status: :unprocessable_entity
        end
    end

    private
    def category_params
        params.permit(:Fruit_Type)
    end

end

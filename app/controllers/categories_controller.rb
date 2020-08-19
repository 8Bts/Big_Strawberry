class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
      @articles = Category.find(params[:id]).articles
    end
end

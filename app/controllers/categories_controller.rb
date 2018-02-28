class CategoriesController < ApplicationController

	def new
		@categories = Category.new
	end

	def create
		@categories = Category.new(category_params)
		@categories.save


	end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end

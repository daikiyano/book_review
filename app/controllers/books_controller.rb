class BooksController < ApplicationController
	
		
	def index
		if params[:category].blank?
		@books = Book.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@books = Book.where(:category_number => @category_id).order("created_at DESC")
		end


	end
	def new
		@book = Book.new
		# @book.category_number = params[:category_number]
		# @categories = Category.all.map{|c| [c.name, c.id]}
	end
	def show
		@book = Book.find(params[:id])
		if @book.reviews.blank?
			@average_review = 0
		else
			@average_review = @book.reviews.average(:rating).round(2)
			
		end

	end
	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to controller: "books", action: "/new"
		else
			render "edit"
		end
	end

	def destroy
		 @book = Book.find(params[:id])
		@book.destroy
		redirect_to root_path
		
	end

	private
	def book_params
		params.require(:book).permit(:title,:description,:author,:category_number, :user_id,:image)
	end
	def find_book
		@book = Book.find(params[:id])
	end

end

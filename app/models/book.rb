class Book < ApplicationRecord

	belongs_to :user
	has_many :reviews
	# belongs_to :category
	mount_uploader :image,ImageUploader


end

class Article < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :author, class_name: 'User'

    has_and_belongs_to_many :categories

    has_many :votes

    
end

class Article < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :author, class_name: 'User'
end

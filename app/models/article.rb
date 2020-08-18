class Article < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :author, class_name: 'User'

    has_and_belongs_to_many :categories

    has_many :votes

    def self.no_articles_img
      return 'https://res.cloudinary.com/strawberry-cloud/image/upload/v1597742437/calum-lewis-rkT_TG5NKF8-unsplash_kt5pig.png'
    end  
    
end

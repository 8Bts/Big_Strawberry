class Article < ApplicationRecord
  attr_accessor :category_id

  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: 'User'

  has_and_belongs_to_many :categories

  has_many :votes, dependent: :destroy

  validates :title, :text, :image, presence: true

  def self.no_articles_img
    'https://res.cloudinary.com/strawberry-cloud/image/upload/v1597782927/joe-woods-4Zaq5xY5M_c-unsplash_mjekpx.png'
  end
end

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :votes
  has_many :articles, foreign_key: 'author_id'
end

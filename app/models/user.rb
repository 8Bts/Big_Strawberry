class User < ApplicationRecord
    validates :name, presence: true
    
    has_many :articles, foreign_key: 'author_id'
end

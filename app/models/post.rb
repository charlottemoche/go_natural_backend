class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :comments
  has_many :likes, dependent: :destroy
end

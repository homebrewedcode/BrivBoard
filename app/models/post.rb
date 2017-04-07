class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { maximum: 300 }
  validates :user_id, presence: true
end

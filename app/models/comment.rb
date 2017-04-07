class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true, length: { maximum: 300 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end

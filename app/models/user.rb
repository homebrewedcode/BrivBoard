class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_many :comments
  has_many :posts
  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
end

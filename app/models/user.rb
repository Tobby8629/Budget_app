class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exchanges, class_name: 'Exchange', foreign_key: 'author_id'
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'

  validates :firstname, presence: true
  validates :lastname, presence: true
end

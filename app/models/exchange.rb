class Exchange < ApplicationRecord
  has_many :category_exchanges, class_name: 'CategoryExchange', foreign_key: 'exchange_id'
  has_many :categories, through: :category_exchanges
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end

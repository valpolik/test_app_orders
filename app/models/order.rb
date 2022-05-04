class Order < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :city_from, presence: true
  validates :city_to, presence: true
end

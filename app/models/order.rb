class Order < ApplicationRecord
  validates :city_from, presence: true
  validates :city_to, presence: true
end

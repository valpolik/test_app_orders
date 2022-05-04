class Comment < ApplicationRecord
  belongs_to :order
  belongs_to :comment, optional: true
  # has_many :comments
  has_many :comments, dependent: :destroy
end

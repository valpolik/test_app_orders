class Order < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :city_from, presence: true
  validates :city_to, presence: true

  def comments_tree
    hash_comments = comments.map { |c| [c.id, c.attributes.merge('children' => [])] }.to_h

    hash_comments.each do |id, comment|
      parent = hash_comments[comment['comment_id']]
      parent['children'] << comment if parent
    end

    hash_comments.select { |id, comment| comment.fetch('comment_id').blank? }.values
  end

  # def destroy_order
  #   transaction do
  #     Comment.destroy_by(order_id: id)
  #     destroy
  #   end
  # end
end

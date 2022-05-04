class V1::Orders::Comments::FolderComments < Grape::API

  desc 'Show comments for this order'
  params do
    requires 'order_id', type: Integer, desc: 'Order ID'
  end
  route_param :order_id do
    get :comments do
      order = Order.find_by(id: params['order_id'])
      error!('order not found', 404) unless order
      p order.comments_tree
    end
  end
end

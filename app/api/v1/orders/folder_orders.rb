class V1::Orders::FolderOrders < Grape::API
  mount V1::Orders::Comments::FolderComments

  desc 'Show all orders'
  get do
    Order.all
  end

  desc 'Show one order by ID'
  params do
    requires 'id', type: Integer, desc: 'Order ID'
  end
  get ':id' do
    order = Order.find_by(id: params['id'])

    order ? order : error!('not found', 404)
  end

  desc 'Create new order'
  params do
    requires 'city_from', type: String, desc: 'City from'
    requires 'city_to', type: String, desc: 'City to'
  end
  post do
    order = Order.new(declared(params, include_missing: false))
    order if order.save!
  end

  desc 'Update order by ID'
  params do
    requires 'id', type: Integer, desc: 'Order ID'
    requires 'city_from', type: String, desc: 'City from'
    requires 'city_to', type: String, desc: 'City to'
  end
  patch ':id' do
    order = Order.find_by(id: params['id'])
    error!('not found', 404) unless order
    order.assign_attributes(declared(params, include_missing: false))
    error!('not valid') unless order.valid?
    order.save!
    order
  end

  desc 'Delete order by ID'
  params do
    requires 'id', type: Integer, desc: 'Order ID'
  end
  delete ':id' do
    order = Order.find_by(id: params['id'])

    order ? order.destroy! : error!('not found', 404)
  end
end

class V1::FolderV1 < Grape::API
  # mount V1::NamespaceOrders => 'orders/'
  mount V1::Orders::FolderOrders => 'orders/'
end

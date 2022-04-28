class FolderAPI < Grape::API
  format :json

  mount V1::FolderV1 => 'api/v1/'

  # get ['*'] do
  get ['/'] do
    {
      'start path' => '/api/v1/orders',
      'Show all orders' => 'GET /api/v1/orders',
      'Show one order by ID' => 'GET /api/v1/orders/:id',
    }
    redirect('/api/v1/orders', permanent: false)
  end

  # post ['*'] do
  #   {'start path' => '/api/v1/orders'}
  # end

  add_swagger_documentation
end

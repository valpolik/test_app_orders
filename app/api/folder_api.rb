class FolderAPI < Grape::API
  format :json

  mount V1::FolderV1 => 'api/v1/'

  get ['/'] do
    {
      'Show all orders' => 'GET /api/v1/orders',
      'Show one order by ID' => 'GET /api/v1/orders/:id',
      'Create new order' => 'POST /api/v1/orders/',
      'Update order by ID' => 'PATCH /api/v1/orders/:id',
      'Delete order by ID' => 'DELETE /api/v1/orders/:id',
      'Show comments for this order' => 'GET /api/v1/orders/:id/comments',
    }
  end

  # get '*' do
  #   redirect('/', permanent: false)
  # end

  add_swagger_documentation
end

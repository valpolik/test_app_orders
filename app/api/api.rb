class API < Grape::API
  format :json

  get ['', '/', 'doc', 'docs'] do
    ['api/v1/orders1']
  end

  resource :api do
    resource :v1 do
      get 'lalala' do
        p([{a: :b}])
      end

      get 'orders' do
        Order.all
      end
    end
  end
end

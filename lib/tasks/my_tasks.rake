CITIES = %w[
  Москва
  Санкт-Петербург
  Новосибирск
  Екатеринбург
  Казань

  Челябинск
  Самара
  Омск
  Ростов-на-Дону
  Уфа
  Красноярск
  Воронеж
  Пермь
  Волгоград
  Краснодар
  Саратов
  Тюмень
  Тольятти
  Ижевск
] + ['Нижний Новгород']

CITIES.freeze


namespace 'my_tasks' do
  desc 'Create orders'
  task 'create_orders' => ['environment'] do
    5.times do
      city_from = nil
      city_to = nil

      city_from = CITIES.sample

      begin
        city_to = CITIES.sample
      end while city_to == city_from

      p Order.create!(city_from: city_from, city_to: city_to)
    end
  end
end

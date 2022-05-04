class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.text :city_from
      t.text :city_to
      t.text :description

      t.timestamps
    end
  end
end

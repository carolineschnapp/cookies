class CreateCookieSales < ActiveRecord::Migration[5.1]
  def change
    create_table :cookie_sales do |t|
      t.string :first_name
      t.money :sales
      t.date :sale_date

      t.timestamps
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cookie_sales_file = Rails.root.join('db', 'seeds', 'sales.yml')
cookie_sales_data = YAML::load_file(cookie_sales_file)

CookieSale.destroy_all

cookie_sales_data.each do |row|
  CookieSale.create!(
    first_name: row['first_name'],
    sales_cents: row['sales'].to_f * 100,
    sales_currency: 'CAD',
    sale_date: row['sale_date'].to_date,
  )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

companies = []
[
  { operating_company_name: 'ジェクサー', home_page_url: 'http://www.jexer.jp/' },
  { operating_company_name: 'コナミ', home_page_url: 'https://www.konami.com/sportsclub/' }
].each do |company|
  record = OperatingCompany.find_by(operating_company_name: company[:operating_company_name])
  if record
    record.attributes = company
    record.save!
  else
    record = OperatingCompany.create!(company)
  end
  companies << record
end

jexcer = companies[0]
konami = companies[1]

[
  { shop_code: '32', shop_name: '大塚' },
  { shop_code: '25', shop_name: '新宿' },
  { shop_code: '5', shop_name: '新宿' },
  { shop_code: '9', shop_name: 'メトロポリタン池袋' },
  { shop_code: '3', shop_name: '四谷' },
  { shop_code: '8', shop_name: '上野' },
  { shop_code: '24', shop_name: '亀戸' },
  { shop_code: '4', shop_name: '大井町' },
  { shop_code: '6', shop_name: '大宮' },
  { shop_code: '7', shop_name: '戸田公園' },
  { shop_code: '17', shop_name: '東神奈川' },
  { shop_code: '37', shop_name: '新川崎' },
  { shop_code: '45', shop_name: '浦和' }
].each do |shop|
  shop[:operating_company_id] = jexcer.id
  unless Shop.exists?(shop_code: shop[:shop_code])
    Shop.create!(shop)
  end
  record = Shop.find_by(shop_code: shop[:shop_code])
  if record
    record.attributes = shop
    record.save!
  else
    Shop.create!(shop)
  end
end


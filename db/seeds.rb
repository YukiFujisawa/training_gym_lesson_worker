OPERATING_COMPANIES = [
  { operating_company_name: 'ジェクサー', home_page_url: 'http://www.jexer.jp/' },
  { operating_company_name: 'コナミ', home_page_url: 'https://www.konami.com/sportsclub/' }
].freeze

JEXCER_SHOPS = [
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
].freeze

KONAMI_SHOPS = [
  { shop_code: '004486', shop_name: '池袋' },
].freeze

def create_operating_companies
  companies = []
  OPERATING_COMPANIES.each do |company|
    record = OperatingCompany.find_by(operating_company_name: company[:operating_company_name])
    if record
      record.attributes = company
      record.save!
    else
      record = OperatingCompany.create!(company)
    end
    companies << record
  end
  companies
end

def create_shops(operating_companies)
  create_jexcer_shops(operating_companies[0].id)
  create_konami_shops(operating_companies[1].id)
end

def create_jexcer_shops(operating_company_id)
  JEXCER_SHOPS.each do |shop|
    shop[:operating_company_id] = operating_company_id
    record = Shop.find_by(shop_code: shop[:shop_code])
    if record
      record.attributes = shop
      record.save!
    else
      Shop.create!(shop)
    end
  end
end

def create_konami_shops(operating_company_id)
  KONAMI_SHOPS.each do |shop|
    shop[:operating_company_id] = operating_company_id
    record = Shop.find_by(shop_code: shop[:shop_code])
    if record
      record.attributes = shop
      record.save!
    else
      Shop.create!(shop)
    end
  end
end

companies = create_operating_companies
create_shops(companies)
class Shop < ApplicationRecord
  validates :operating_company_id, presence: true
  validates :shop_name, presence: true
end

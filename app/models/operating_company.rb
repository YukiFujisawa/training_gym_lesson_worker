class OperatingCompany < ApplicationRecord
  has_many :shops, dependent: :destroy
end

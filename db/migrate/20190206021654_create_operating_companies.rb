class CreateOperatingCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_companies do |t|
      t.string :operating_company_name
      t.string :home_page_url
      t.timestamps
    end
  end
end

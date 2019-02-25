class CreateOperatingCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_companies do |t|
      t.string :operating_company_name , null: false
      t.string :home_page_url, null: false
      t.timestamps
    end
  end
end

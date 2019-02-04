class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :operating_company_id
      t.string :shop_name
      t.timestamps
    end
  end
end

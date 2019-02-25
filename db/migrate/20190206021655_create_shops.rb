class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_code, null: false
      t.string :shop_name, null: false
      t.belongs_to :operating_company, foreign_key: true
      t.timestamps
      t.index [:shop_code]
    end
  end
end

require 'rails_helper'
require 'konami/konami_page'

RSpec.describe KonamiPage do
  let!(:driver) { TrainingGymLessonWorker.get_driver }
  let(:page_object) { KonamiPage.new(driver) }

  describe '#shop_select' do
    shop_list = Shop.where(operating_company_id: 2)
    shop_list.each do |shop|
      context "#{shop.shop_name}店を表示した場合" do
        it do
          page_object.go_shop_page(shop)
          expect(driver.title).to match /コナミスポーツクラブ #{shop.shop_name}/
        end
      end

    end
  end
end
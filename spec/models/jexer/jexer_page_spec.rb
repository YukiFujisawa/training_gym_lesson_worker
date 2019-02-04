require 'rails_helper'
require 'jexer/jexer_page'
require 'jexer/jexer_shops'

RSpec.describe JexerPage, type: :model  do
  let!(:driver) { TrainingGymLessonWorker.get_driver }
  let(:page_object) { JexerPage.new(driver) }

  describe '#shop_select' do
    JexerShops::LIST.each do |shop|
      context "#{shop.shop_name}店を表示した場合" do
        it do
          page_object.go_shop_page(shop)
          expect(driver.title).to match /#{shop.shop_name}【グループエクササイズタイムスケジュール】/
        end
      end

    end
  end
end
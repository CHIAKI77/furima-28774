require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("#{::Rails.root}/spec/fixtures/testimage.jpeg", "image/jpeg")
    end
    describe 'ユーザー新規登録' do
      context '商品出品登録がうまくいかないとき' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'descriptionが空では登録できないこと' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'category_idを選択していないときでは登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it 'condition_idを選択していないときでは登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end

        it 'shipping_burden_idを選択していないときでは登録できないこと' do
          @item.shipping_burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping burden must be other than 1")
        end

        it 'shipping_region_idを選択していないときでは登録できないこと' do
          @item.shipping_region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
        end

        it 'shipping_day_idを選択していないときでは登録できないこと' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end

        it 'priceが空では登録できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが300未満であれば登録できないこと' do
          @item.price = '200'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it 'priceが10000000以上であれば登録できないこと' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end

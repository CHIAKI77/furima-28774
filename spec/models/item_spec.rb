require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("#{::Rails.root}/spec/fixtures/testimage.jpeg", 'image/jpeg')
    end
    describe 'ユーザー新規登録' do
      context '商品出品登録がうまくいかないとき' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end

        it 'nameが空では登録できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end

        it 'descriptionが空では登録できないこと' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の説明を入力してください")
        end

        it 'category_idを選択していないときでは登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
        end

        it 'condition_idを選択していないときでは登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
        end

        it 'shipping_burden_idを選択していないときでは登録できないこと' do
          @item.shipping_burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
        end

        it 'shipping_region_idを選択していないときでは登録できないこと' do
          @item.shipping_region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
        end

        it 'shipping_day_idを選択していないときでは登録できないこと' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
        end

        it 'priceが空では登録できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください", "販売価格は不正な値です")
        end

        it 'priceが300未満であれば登録できないこと' do
          @item.price = '200'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
        end

        it 'priceが10000000以上であれば登録できないこと' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
        end

        it 'priceが空では半角数字以外では登録できないこと' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
        end
      end
    end
  end
end

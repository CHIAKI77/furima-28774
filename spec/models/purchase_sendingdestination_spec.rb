require 'rails_helper'

RSpec.describe PurchaseSendingdestination, type: :model do
  describe '配送先情報の保存' do
    before do
      @purchase_sendingdestination = FactoryBot.build(:purchase_sendingdestination)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_sendingdestination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_sendingdestination.building_name = nil
        expect(@purchase_sendingdestination).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @purchase_sendingdestination.token = nil
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'post_codeが空だと保存できないこと' do
        @purchase_sendingdestination.post_code = nil
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_sendingdestination.post_code = '1234567'
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idを選択していないときでは登録できないこと' do
        @purchase_sendingdestination.prefecture_id = 1
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityが空だと保存できないこと' do
        @purchase_sendingdestination.city = nil
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_sendingdestination.house_number = nil
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_sendingdestination.phone_number = nil
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
      end
      it 'phone_numberにハイフンが含むと保存できないこと' do
        @purchase_sendingdestination.phone_number = '090-1234'
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @purchase_sendingdestination.phone_number = '090123456789'
        @purchase_sendingdestination.valid?
        expect(@purchase_sendingdestination.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
    end
  end
end

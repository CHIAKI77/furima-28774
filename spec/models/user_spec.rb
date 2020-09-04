require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに＠含まれていないと登録できないこと' do
          @user.email = 'test1gamil.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが半角英語のみでは登録できないこと' do
          @user.password = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
        end

        it 'passwordが半角数字のみでは登録できないこと' do
          @user.password = '12345678'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
        end

        it 'passwordが全角数字のみでは登録できないこと' do
          @user.password = '１２３４５６７８'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'family_nameが空では登録できないこと' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'family_name_kanaが空では登録できないこと' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
          @user.family_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name is invalid')
        end

        it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
          @user.first_name = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it 'family_name_kanaが全角（カタカナ）以外では登録できないこと' do
          @user.family_name_kana = 'やまだ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana is invalid')
        end

        it 'first_name_kanaが全角（カタカナ）以外では登録できないこと' do
          @user.first_name_kana = 'たろう'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'ユーザー管理機能' do
      before do
        @user = FactoryBot.build(:user)
      end

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在すると登録することはできない" do
        @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailには@を含んでいないと登録できない" do
        @user.email = "out.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank","Password Include both letters and numbers")
      end

      it "passwordは6文字以上でないと登録できない" do
        @user.password = "Test2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは全角文字では登録できない" do
        @user.password = "パスワードダミー"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordは数字だけでは登録できない" do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordは英字だけでは登録できない" do
        @user.password = "Montamonta"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password = "Monta27"
        @user.password_confirmation = "Monta22"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name Full-width characters")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name Full-width characters")
      end

      it "last_nameは全角（漢字、カタカナ、ひらがな）でないと登録できない" do
        @user.last_name = "monta"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end

      it "first_nameは全角（漢字、カタカナ、ひらがな）でないと登録できない" do
        @user.first_name = "naoki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana Full-width katakana characters")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana Full-width katakana characters")
      end

      it "last_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = "もんた"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end

      it "first_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = "なおき"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it "birth_dateが空だと登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
end

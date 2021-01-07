require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
        before do
          @user = FactoryBot.build(:user)
          @item = FactoryBot.build(:item)
          @item_order = FactoryBot.build(:item_order,user_id: @user.id,item_id: @item.id)
          sleep 0.1
          end
    describe '商品購入機能' do

      context '商品購入の保存がうまくいかないとき' do
        it "postal_codeが空のとき保存することはできない" do
          @item_order.postal_code=""
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code input correctly")
        end

        it "postal_codeが半角のハイフンを含んでいないと保存することはできない" do
          @item_order.postal_code ="4560072"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Postal code input correctly")
        end

        it "prefecture_idが選択されていないと保存することができない" do
          @item_order.prefecture_id = 0
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Prefecture Select")
        end

        it "cityが空だと保存することができない" do
          @item_order.city=""
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("City can't be blank")
        end

        it "house_numberが空だと保存することができない" do
          @item_order.house_number=""
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("House number can't be blank")
        end

        it "phoneが空だと保存することができない" do
          @item_order.phone=""
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Phone can't be blank", "Phone input only number")
        end

        it "iphoneが半角数字でないと保存することができない" do
          @item_order.phone="０９０１２３４１２３４"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Phone input only number")
        end

        it "tokenが空だと保存することができない" do
          @item_order.token=""
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Token can't be blank")
        end
      end

      context "商品購入の保存がうまくいくとき" do
        it "全ての値が正しく入力されていれば保存することができる" do
          @item_order.valid?
          expect(@item_order).to be_valid
        end

        it "building_nameが空でも保存することができる" do
          @item_order.building_name = ""
          expect(@item_order).to be_valid
        end
      end

  end
end

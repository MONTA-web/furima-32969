require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "imageが空だと保存することができない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "product_nameが空だと保存することができない" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "descriptionが空だと保存することができない" do
      @item.description=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "categoryが選択されていないと保存することができない" do 
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "category_idが空だと保存することができない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category Select")
    end

    it "conditionが選択されていないと保存することができない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")
    end

    it "condition_idが空だと保存することができない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition Select")
    end

    it "shipping_chargeが選択されていないと保存することができない" do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge Select")
    end

    it "shipping_charge_idが空だと登録することができない" do
      @item.shipping_charge_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank", "Shipping charge Select")
    end

    it "prefectureが選択されていないと保存することができない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "prefecture_idが空だと保存することができない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Select")
    end

    it "deadlineが選択されていないと保存することができない" do
      @item.deadline_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Deadline Select")
    end

    it "deadline_idが空だと保存することができない" do
      @item.deadline_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Deadline can't be blank", "Deadline Select")
    end

    it "priceが空だと保存することができない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank",
        "Price Half-width number",
        "Price Out of setting range")
    end

    it "priceは300より低いと保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceは9,999,999より大きいと保存することができない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceは半角数字しか保存することができない" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end

    it "全ての情報を適切に入力すると保存することができる" do
      @item.save
      expect(@item).to be_valid
    end



  end
end

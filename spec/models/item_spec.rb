require 'rails_helper'

RSpec.describe Item, type: :model do
   before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいく場合' do
      it 'すべての選択欄が存在すれば登録できる' do
      expect(@item).to be_valid
      end
    end
  end

  describe '商品出品登録' do
    context '商品出品登録がうまく行かない場合' do 
      it 'imageがない場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameがない場合は出品できない' do
        @item.item_name = nil
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionがない場合は出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idがない場合は出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idがない場合は出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_payer_idがない場合は出品できない' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'postage_area_idがない場合は出品できない' do
        @item.postage_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage area can't be blank")
      end
      it 'postage_day_idがない場合は出品できない' do
        @item.postage_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage day can't be blank")
      end
      it 'item_priceがない場合は出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが半角数値ではない場合は出品できない' do
        @item.save
        @item.item_price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが299なら登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it 'item_priceが9999999以上なら登録できない' do
        @item.item_price = '9'*30 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
    end
  end
end

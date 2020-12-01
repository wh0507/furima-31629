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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'item_nameがない場合は出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("お名前を入力してください")
      end
      it 'descriptionがない場合は出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idがid:1の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'category_idがない場合は出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'condition_idがない場合は出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'postage_payer_idがid:1の場合は出品できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'postage_payer_idがない場合は出品できない' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'postage_area_idがid:1の場合は出品できない' do
        @item.postage_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end
      it 'postage_area_idがない場合は出品できない' do
        @item.postage_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'postage_day_idがid:1の場合は出品できない' do
        @item.postage_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
      it 'postage_day_idがない場合は出品できない' do
        @item.postage_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'item_priceがない場合は出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価額を入力してください")
      end
      it 'item_priceが半角数値ではない場合は出品できない' do
        @item.save
        @item.item_price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価額は不正な値です')
      end
      it 'item_priceが299なら登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価額は300以上の値にしてください')
      end
      it 'item_priceが10000000以上なら登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価額は9999999以下の値にしてください')
      end
    end
  end
end

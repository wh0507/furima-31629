require 'rails_helper'

RSpec.describe OrderDonation, type: :model, js: true do
  describe '販売情報の保存' do
    
    before do
      @order = FactoryBot.build(:order_donation)
    end

    describe "保存できる" do
      it "tokenがあれば保存ができること" do
        expect(@order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    describe "保存できない" do
      it "tokenが空では保存できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idがid:1の場合は保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idがない場合は保存できないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが数字のみであれば保存できないこと' do
        @order.city = '123'
        @order.valid?
        expect(@order.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it 'addressが空だと保存できないこと' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角のハイフンを含むと保存できないこと' do
        @order.phone_number = '123-4567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end

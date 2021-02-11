require 'rails_helper'

RSpec.describe PurchaseData, type: :model do
  describe 'テスト' do
    before do
      @purchase_data = FactoryBot.build(:purchase_data)
    end

    context "内容に問題がない場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_data).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_data.building_name = ''
        expect(@purchase_data).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_data.postal_code = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_data.postal_code = "12345678"
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_data.prefecture_id = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @purchase_data.prefecture_id = 1
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_data.city = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが半角だと保存できないこと' do
        @purchase_data.city = "city"
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("City is invalid. Input full-width characters")
      end
      it 'street_numberが空だと保存できないこと' do
        @purchase_data.street_number = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Street number can't be blank")
      end
      it 'street_numberが正しい形式でないと保存できないこと 例)〇〇町〇-〇-〇' do
        @purchase_data.street_number = "test"
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Street number is invalid")
      end
      it 'building_nameは半角から始まると保存できないこと' do
        @purchase_data.building_name = "t柳ビル"
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Building name is invalid. Input full-width characters")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_data.phone_number = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは12桁以上だと保存できないこと' do
        @purchase_data.phone_number = "123456789123"
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Phone number length must be within 11 digits")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_data.token = nil
        @purchase_data.valid?
        expect(@purchase_data.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '#create' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
  end

    context '内容に問題ない場合' do
      it 'tokenと配送先入力があれば保存ができる' do
        expect(@purchase_shipping).to be_valid
      end

      it 'building_nameが空でも保存ができる' do
        @purchase_shipping.building_name = nil
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存ができない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_code（郵便番号）が空だと保存できないこと' do
        @purchase_shipping.postal_code = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code（郵便番号）にハイフンが含まれていないと保存できないこと' do
        @purchase_shipping.postal_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
    
      it 'prefecture_id（都道府県）が1（無効な値）だと保存できないこと' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture must be other than 1")
      end
    
      it 'city（市区町村）が空だと保存できないこと' do
        @purchase_shipping.city = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
    
      it 'street_address（番地）が空だと保存できないこと' do
        @purchase_shipping.street_address = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street address can't be blank")
      end
    
      it 'phone_number（電話番号）が空だと保存できないこと' do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
    
      it 'phone_numberが数字以外だと保存できないこと' do
        @purchase_shipping.phone_number = "abcdg5678"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
    
      it 'phone_numberが11桁を超えると保存できないこと' do
        @purchase_shipping.phone_number = "0901234567890"  # 12桁の電話番号
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
    
      it 'phone_numberがハイフンを含むと保存できないこと' do
        @purchase_shipping.phone_number = "090-1234-5678"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'user_idが空だと購入できないこと' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

# 消すこと
#       it '配送先入力が空では保存ができない' do
# @purchase_shipping.postal_code = nil
# @purchase_shipping.valid?
# expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
# end
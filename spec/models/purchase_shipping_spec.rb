require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '#create' do
    before do
      @purchase_shipping = FactoryBot.build(:purchase_shipping)
    end

    context '内容に問題ない場合' do
      it 'tokenと配送先入力があれば保存ができる' do
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存ができない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先入力が空では保存ができない' do
        @purchase_shipping.postal_code = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end
end

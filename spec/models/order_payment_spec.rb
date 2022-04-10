require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_payment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_payment).to be_valid
      end
      it '建物名は空でも登録できる' do
        expect(@order_payment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ユーザー登録している人でないと購入できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it '購入商品が空だと購入できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと購入できないこと' do
        @order_payment.postcode = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order_payment.postcode = 123-4567
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it '発送地域が空だと購入できない' do
        @order_payment.prefecture_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送地域が「---」だと購入できない' do
        @order_payment.prefecture_id = 0
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @order_payment.city = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_payment.adress= ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_payment.phone_num = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone num can't be blank")
     end
      it '電話番号にハイフンがあると購入できない' do
        @order_payment.phone_num = '070-1234-5678'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が12桁以上あると保存できないこと' do
         @order_payment.phone_num = '12_34_56_78_910_12_31_11'
         @order_payment.valid?
         expect(@order_payment.errors.full_messages).to include("Phone num is invalid")   
      end
      it 'トークンが空だと購入できない' do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
   end
 end
end

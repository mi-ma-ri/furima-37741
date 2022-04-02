require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end
  
 describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目入力ができているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'ユーザー登録してる人でないと登録できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.item_name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.descryption = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Descryption can't be blank")
      end
      it '商品カテゴリーが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品状態が「---」だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料が空だと出品できない' do
        @item.ship_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it '配送料が「---」だと出品できない' do
        @item.ship_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it '発送地域が空だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送地域が「---」だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日数が空だと出品できない' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it '発送日数が「---」だと出品できない' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it '販売価格が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円未満だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
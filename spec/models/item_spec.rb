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
        expect(@item.errors.full_messages).to include("User must exist", "User can't be blank")
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
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品状態が空だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it ''
        @item.ship_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it ''
    end
  end
end
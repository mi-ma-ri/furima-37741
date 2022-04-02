class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #モデルのアソシエーション
  belongs_to :user
  #has_one :order

  #イメージファイルの紐付け
  has_one_attached :image

  #active hashモデルのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :schedule

  with_options presence: true do
    validates :user_id
    validates :item_name
    validates :image
    validates :descryption
    validates :category_id
    validates :status_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :schedule_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

    # ジャンルの選択が「--」の時は保存不可
    with_options numericality: { other_than: 0  } do
      validates :category_id
      validates :category_id
      validates :status_id
      validates :ship_cost_id
      validates :prefecture_id
      validates :schedule_id
  end
end

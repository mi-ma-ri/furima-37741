# テーブル設計

## users テーブル

|      Column        |  Type  |   Options   |
| ------------------ | ------ | ----------- |
|      nickname      | string | null: false | 
|       email        | string | null: false,unique: true |
| encrypted_password | string | null: false |
|     last_name      | string | null: false |
|     first_name     | string | null: false |
| last_name_katakana | string | null: false |
| first_name_katakana| string | null: false |
|     birthday       |  date  | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

|      Column        |     Type     |   Options   |
| ------------------ | ------------ | ----------- |
|       user         |  references  | null: false, foreign_key:true |
|     item_name      |    string    | null: false |
|    descryption     |     text     | null: false |
|     category_id    |    integer   | null: false |
|      status_id     |    integer   | null: false |
|     ship_cost_id   |    integer   | null: false |
|     prefecture_id  |    integer   | null: false |
|      schedule_id   |    integer   | null: false |
|       price        |    integer   | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

|      Column        |     Type     |   Options   |
| ------------------ | ------------ | ----------- |
|       user         |  references  | null: false, foreign_key:true |
|       item         |  references  | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item

## payments テーブル

|      Column      |     Type     |   Options   |
| ---------------- | ------------ | ----------- |
|    order         |  references  | null: false, foreign_key:true |
|    postcode      |    string    | null: false |
|    prefecture_id |   integer    | null: false |
|    city          |    string    | null: false |
|    adress        |    string    | null: false |
|    building      |    string     
|    phone_num     |    string    | null: false |

### Association

- belongs_to :order
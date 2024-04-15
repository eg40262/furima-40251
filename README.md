usersテーブル
  has_many :items
  has_many :purchases
| Column                 | Type   | Option                     | 
| ---------------------- | ------ | -------------------------- | 
| nickname               | string | null: false                | 
| email                  | string | null: false, unique: true  | 
| encrypted_password     | string | null: false                |  
| last_name              | string | null: false                | 
| first_name             | string | null: false                | 
| last_name_kana         | string | null: false                | 
| first_name_kana        | string | null: false                | 
| birth_date             | date   | null: false                | 


itemsテーブル（商品情報）
  belongs_to :user
  has_one    :purchase
| Column                 | Type        | Option                         | Description | 
| ---------------------- | ----------- | ------------------------------ | ----------- | 
| name                   | string      | null: false                    |             | 
| info                   | text        | null: false                    |             | 
| category_id            | integer     | null: false                    |             | 
| sales_status_id        | integer     | null: false                    |             | 
| shipping_fee_status_id | integer     | null: false                    |             | 
| prefecture_id          | integer     | null: false                    |             | 
| scheduled_delivery_id  | integer     | null: false                    |             | 
| price                  | integer     | null: false                    |             | 
| user                   | references  | null: false, foreign_key: true |             | 

purchasesテーブル（購入情報）
  belongs_to :user
  belongs_to :item
  has_one    :shipping
| Column   | Type       | Option                         | Description            | 
| -------- | ---------- | ------------------------------ | ---------------------- | 
| user     | references | null: false, foreign_key: true | references users Table | 
| item     | references | null: false, foreign_key: true | references items Table | 

shippingsテーブル（発送情報）
  belongs_to :purchase
| Column                  | Type       | Option                         |Description                | 
| ----------------------- | ---------- | ------------------------------ |-------------------------- | 
| postal_code             | string     | null:false                    |                            | 
| prefecture_id           | integer    | null:false                    |                            | 
| city                    | string     | null:false                    |                            | 
| street_address          | string     | null:false                    |                            | 
| building_name           | string     |null:true                      |                            | 
| phone_number            | string     |null:false                     |                            | 
| purchase                | references | null: false, foreign_key: true | references purchasesTable | 






usersテーブル
  has_many :items
  has_many :purchases
| Column                 | Type   | Option       | 
| ---------------------- | ------ | ------------ | 
| nickname               | string | null: false  | 
| email                  | string | null: false  | 
| password               | string | null: false  | 
| password_confirmation  | string | null: false  | 
| last_name              | string | null: false  | 
| first_name             | string | null: false  | 
| last_name_kana         | string | null: false  | 
| first_name_kana        | string | null: false  | 
| birth_date             | date   | null: false  | 


itemsテーブル（商品情報）
  belongs_to :users
  has_one    :purchase
| Column                      | Type        | Option                   | Description | 
| --------------------------- | ----------- | ------------------------ | ----------- | 
| item_name                   | string      | null: false              |             | 
| item_info                   | text        | null: false              |             | 
| item_category_id            | integer     | null: false              |             | 
| item_sales_status_id        | integer     | null: false              |             | 
| item_shipping_fee_status_id | integer     | null: false              |             | 
| item_prefecture_id          | integer     | null: false              |             | 
| item_scheduled_delivery_id  | integer     | null: false              |             | 
| item_price                  | integer     | null: false              |             | 
| user                        | references  | null: false, foreign key |             | 

purchasesテーブル（購入情報）
  belongs_to :item
  has_one     :shipping
| Column   | Type       | Option                   | Description            | 
| -------- | ---------- | ------------------------ | ---------------------- | 
| user     | references | null: false, foreign key | references items Table | 
| item     | references | null: false, foreign key | references items Table | 

shippings（発送情報）
  belongs_to :item
| Column                  | Type       | Option                   | Description                | 
| ----------------------- | ---------- | ------------------------ | -------------------------- | 
| tracking_number         | string     | null: false              |                            | 
| carrier                 | string     | null: false              |                            | 
| estimated_delivery_date | string     | null: false              |                            | 
| postal_code             | string     | null: false              |                            | 
| prefecture              | string     | null: false              |                            | 
| city                    | string     | null: false              |                            | 
| street_address          | string     | null: false              |                            | 
| building_name           | string     | null: true               |                            | 
| phone_number            | string     | null: false              |                            | 
| purchase                | references | null: false, foreign key | references purchases Table |






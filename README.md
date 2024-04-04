usersテーブル
| Column                 | Type   | Option                    | 
| ---------------------- | ------ | ------------------------- | 
| nickname               | string | null: false               | 
| email                  | string | null: false, unique: true | 
| password               | string | null: false               | 
| password_confirmation  | string | null: false               | 
| last_name              | string | null: false               | 
| first_name             | string | null: false               | 
| last_name_kana         | string | null: false               | 
| first_name_kana        | string | null: false               | 
| birth_date             | string | null: false               | 


itemsテーブル（商品情報）
| Column                    | Type       | Option                   | Description | 
| ------------------------- | ---------- | ------------------------ | ----------- | 
| item_name                 | string     | null: false              |             | 
| item_info                 | text       | null: false              |             | 
|  item_category            | string     | null: false              |             | 
|  item_sales_status        | string     | null: false              |             | 
|  item_shipping_fee_status | string     | null: false              |             | 
|  item_prefecture          | string     | null: false              |             | 
|  item_scheduled_delivery  | string     | null: false              |             | 
|  item_price               | string     | null: false              |             | 
|  user                     | references | null: false, foreign key |             | 

purchasesテーブル（購入情報）
| Column   | Type       | Option                   | Description            | 
| -------- | ---------- | ------------------------ | ---------------------- | 
| user     | references | null: false, foreign key | references items Table | 
| item     | references | null: false, foreign key | references items Table | 

shippings（発送情報）
| Column                  | Type       | Option                   | Description                | 
| ----------------------- | ---------- | ------------------------ | -------------------------- | 
| tracking_number         | string     | null: false              |                            | 
| carrier                 | string     | null: false              |                            | 
| estimated_delivery_date | string     | null: false              |                            | 
| purchase                | references | null: false, foreign key | references purchases Table | 





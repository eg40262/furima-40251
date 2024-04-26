class purchase_shipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :purchase
  belongs_to :user
  belongs_to :item
  belongs_to :purchase
  has_one    :shipping
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
        # 寄付情報を保存し、変数donationに代入する
        donation = Donation.create(price: price, user_id: user_id)
        # 住所を保存する
        # donation_idには、変数donationのidと指定する
        Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  end
end
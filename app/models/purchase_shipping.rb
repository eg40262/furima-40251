class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
    # numericality: { other_than: 1, message: "must be other than 1" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Shipping.create(postal_code:, prefecture_id:, city:, street_address:,
                    building_name:, phone_number:, purchase_id: purchase.id)
  end
end

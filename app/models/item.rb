class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :user, presence: true
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

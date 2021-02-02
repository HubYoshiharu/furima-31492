class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
  belongs_to :category, :condition, :burden, :prefecture, :shipping_days

  with_options presence: true do
    validates :image, unless: :was_attached?
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :prefecture_id
      validates :shipping_days_id
    end
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of range"}, format: {with: /\A[0-9]+\z/, message: "must be half-width characters"}
    validates :user
  end

  def was_attached?
    self.image.attached?
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase_record
  belongs_to :user
  belongs_to :category, :condition, :burden, :prefecture, :shipping_days

  with_options presence: true do
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :prefecture
      validates :shipping_days_id
    end
    validates :price
    validates :user
  end
end

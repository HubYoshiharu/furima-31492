class PurchaseRecord < ApplicationRecord
  belongs_to :user, :item
  has_one :address
end
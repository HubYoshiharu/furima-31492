class PurchaseRecord < ApplicationRecord
  belongs_to :user, :item
end

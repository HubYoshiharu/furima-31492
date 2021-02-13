class PurchaseData
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
    validates :street_number, format: { with: /\A[ぁ-んァ-ン一-龥々]*\d+(-\d+)*\z/, message: 'is invalid' }
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'length must be within 11 digits' }
    validates :token
  end
  validates :user_id, presence: { message: "id can't be blank" }
  validates :item_id, presence: { message: "id can't be blank" }
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters' },
                            if: :building_name_present?

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number,
                   building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

  def building_name_present?
    building_name.present?
  end
end

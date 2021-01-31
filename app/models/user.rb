class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' } do
      validates :firstname
      validates :lastname
    end
    with_options format: { with: /\A[ァ-ン一]/, message: 'is invalid. Input full-width kana characters.' } do
      validates :firstname_reading
      validates :lastname_reading
    end
    validates :nickname
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'includes both letters and numbers.' }
end

class User < ApplicationRecord
  has_many :items
  has_many :purchases
  with_options presence: true do
    validates :nick_name
    validates :email
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
    validates :birthday
  end

  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/, message: 'Password Include both letters and numbers'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

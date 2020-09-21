class User < ApplicationRecord
  has_many :items
  has_many :purchases
  with_options presence: true do
    validates :nick_name
    validates :email
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
    validates :birthday
  end

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{6,100}+\z/, message: 'Include both letters and numbers'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

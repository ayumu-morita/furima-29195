class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  

  validates :name, :description, :price, :category_id, :delivery_day_id, :fee_burden_id, :prefecture_id, :status_id, :image, presence: true

  validates_inclusion_of :price, in: 300..999999 

  validates :price, format: {with: /\A[a-zA-Z0-9]+\z/, message: 'Price Half-width number'}

  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  validates :fee_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
end

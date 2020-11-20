class Item < ApplicationRecord
  belongs_to :user
  has_one :oder
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :postage_payer_id
  belongs_to :postage_area_id
  belongs_to :postage_day_id
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :postage_area_id, presence: true
  validates :postage_day_id, presence: true
  validates :item_price, presence: true
  validates :image, presence: true
end

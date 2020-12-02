class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :postage_area
  belongs_to_active_hash :postage_day
  has_many_attached :images

  with_options presence: true do
    validates :item_name
    validates :description
    validates :item_price, format: { with: /\A[0-9]\d+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :images
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :postage_area_id
    validates :postage_day_id
  end
end

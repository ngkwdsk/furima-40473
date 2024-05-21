class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :caption, :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, :price, :image, presence: true
  validates :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal: 9999999 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :ship_date
end

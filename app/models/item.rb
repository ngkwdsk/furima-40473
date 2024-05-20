class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :caption, :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, :price, :image, presence: true
  validates :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end

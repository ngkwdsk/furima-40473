class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  validates :name, :caption, :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, :price, :images, presence: true
  validates :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :ship_date
end

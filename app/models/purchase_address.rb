class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角数字（ハイフンあり）で入力してください' }
    validates :region_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :block
    validates :phone, format: {with: /\A0\d{9,10}\z/, message: 'は半角数字（ハイフンなし）で、8桁か9桁で入力してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, block: block, building: building, phone: phone, purchase_id: purchase.id )
  end
end

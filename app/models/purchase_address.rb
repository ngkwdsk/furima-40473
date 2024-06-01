class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width characters' }
    validates :block
    validates :phone, format: {with: /\A0\d{9,10}\z/, message: 'is invalid. Enter it as follows (e.g. 012345678)' }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, block: block, building: building, phone: phone, purchase_id: purchase.id )
  end
end

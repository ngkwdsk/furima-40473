class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
		gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
		@purchase_address = PurchaseAddress.new
  end

	def create
		@item = Item.find(params[:item_id])
		@purchase_address = PurchaseAddress.new(order_params)
		if @purchase_address.valid?
			pay_item
			@purchase_address.save
			redirect_to root_path
		else
			gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
			render :index, status: :unprocessable_entity
		end
	end

	private

	def order_params
		params.require(:purchase_address).permit(:post_code, :region_id, :city, :block, :building, :phone, :purchase_id).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
	end

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
		Payjp::Charge.create(
      amount: @item.price,
			card: order_params[:token],
			currency: 'jpy'
		)
	end
end
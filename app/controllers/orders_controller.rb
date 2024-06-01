class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
		@purchase_address = PurchaseAddress.new
  end

	def create
		@purchase_address = PurchaseAddress.new(order_params)
		if @purchase_address.valid?
			@purchase_address.save
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def order_params
		params.require(:purchase_address).permit(:post_code, :region_id, :city, :block, :building, :phone, :purchase_id)
	end
end
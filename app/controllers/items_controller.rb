class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: {item: item}
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :caption, :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
end
class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @previous_item = Item.where("id < ?", @item.id).last
    @next_item = Item.where("id > ?", @item.id).first
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :caption, :category_id, :condition_id, :postage_id, :region_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end
end

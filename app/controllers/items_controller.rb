class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
    render layout: 'compact'
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def show
    render layout: 'compact'
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    else
      redirect_to new_items_path
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category, :size, :brand, :condition, :postage_player, :region, :preparation_days, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end

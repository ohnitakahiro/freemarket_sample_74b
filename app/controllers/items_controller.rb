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
    @item = Item.find(params[:id])
    render layout: 'compact'
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    else
      redirect_to new_item_path
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def set_parents
    @parents  = Category.where(ancestry: nil)
  end

  def set_children
    @children = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchildren
    @grandchildren = Category.where(ancestry: params[:ancestry])
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :size, :brand, :condition, :postage_player, :region, :preparation_days, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end

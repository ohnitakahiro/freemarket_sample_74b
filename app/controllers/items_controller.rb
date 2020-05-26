class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_images, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
    render layout: 'compact'
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def show
    render layout: 'compact'
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      @item.save
    else
      redirect_to edit_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :introduction, :category_id, :size, :brand, :condition_id, :postage_player_id, :region_id, :preparation_day_id, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_images
    @images = Image.where(item_id: params[:id])
  end

end

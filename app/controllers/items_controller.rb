class ItemsController < ApplicationController


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def aaa
  end

end

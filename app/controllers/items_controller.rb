class ItemsController < ApplicationController


  def index
    @items = Item.all.order(created_at: :desc)
    render layout: 'compact'
  end

  def new
  end

  def show
    render layout: 'compact'
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

class OrdersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item

  def index
    if @card.blank?
      redirect_to controller: "creditcard", action: "new"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer =Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @address = Address.find_by(user_id: current_user.id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
  redirect_to action: 'done'
  end

  def done
    @item.update(soldout: current_user.id)
  end

  private
  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

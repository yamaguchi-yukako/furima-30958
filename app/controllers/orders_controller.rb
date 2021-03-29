class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @orders = OrderForm.new
  end

  def create
    @orders = OrderForm.new(order_params)
    if @orders.valid?
      pay_item
     
    @orders.save
      redirect_to root_path
      
    else
      render :index
    end
  end
  private

  def order_params
    params.require(:order_form).permit( :postal_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  
  def pay_item
  
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
    amount: @item.price,  
    card: order_params[:token],  
    currency: 'jpy'              
  )
 end

def move_to_index
if current_user.id == @item.user.id|| @item.order.present?
redirect_to root_path
end
end

def set_item
  @item = Item.find(params[:item_id])
end

end

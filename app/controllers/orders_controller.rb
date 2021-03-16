class OrdersController < ApplicationController
  def index
    @orders = OrderForm.new
  end

  def create
    @orders = OrderForm.new(order_params)
    if @orders.valid?
    @orders.save(order_params)
      redirect_to root_path
      
    else
      render :index
    end
  end
  private
  def order_params
    params.require(:order).permit(:name, :image, :text, :user_id, :item_id)
  end
end

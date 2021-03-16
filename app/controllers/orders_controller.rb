class OrdersController < ApplicationController
  def index
    @orders = OrderForm.new
  end

  def create
 
    @orders = OrderForm.new(order_params)
    if @orders.valid?
    @orders.save
      redirect_to root_path
      
    else
      render :index
    end
  end
  private
  def order_params
    params.require(:order_form).permit( :postal_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
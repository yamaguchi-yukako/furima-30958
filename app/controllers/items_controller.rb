class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.create 
    redirect_to action: 'index'
  end
  private
  def item_params
    params.require(:item).permit (:image)
  end
end

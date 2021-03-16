class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
 
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:text, :price, :category_id, :cost_id , :condition_id ,:prefecture_code_id, :day_id, :info, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
  def set_item
    @item = Item.find(params[:id])
  end
end

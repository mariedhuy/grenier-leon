class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = Item.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :description, :picture)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

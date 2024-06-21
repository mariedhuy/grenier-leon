class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  categories = "%w[cuisine maison outils]"

  def index
    if params[:query].present?
      @items = Item.where("name ILIKE?", "%#{params[:query]}%")
    # elsif params[:filter].present?
    #   @items = Item.where("name ILIKE?", "%#{params[:filter]}%")
    else
      @items = Item.all
    end
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

  def my_items
    @items = Item.where(user: current_user)
  end

  private

  def items_params
    params.require(:item).permit(:name, :category, :description, :picture)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

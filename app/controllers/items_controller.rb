class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = Item.all
    if params[:query].present?
      @items = @items.where("name ILIKE?", "%#{params[:query]}%")
    elsif params[:filter].present?
      @items = @items.where("category LIKE?", "#{params[:filter]}")
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

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to my_items_path, status: :see_other
  end


  def my_items
    @items = Item.where(user: current_user)
  end

  private

  def items_params
    params.require(:item).permit(:name, :category, :description, :picture, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

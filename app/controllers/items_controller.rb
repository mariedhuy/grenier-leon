class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = Item.where.not(user: current_user)

    if params[:location].present?
      @owners = User.near(params[:location], 30, order: :distance)
      @items = @items.where(user: @owners.to_a)
    end

    if params[:item].present?
      @items = @items.search_by_name_and_category("%#{params[:item]}%")
    elsif params[:filter].present?
      @items = @items.search_by_category("%#{params[:filter]}%")
    end

    @users = @items.map{ |item| item.user}.uniq
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "items/info_window", locals: {user: user}, formats: [:html]),
        marker_html: render_to_string(partial: "items/marker", locals: {user: user}, formats: [:html])
      }
    end

    respond_to do |format|
      format.html
      format.text { render partial: "items/index",
                    locals: { items: @items }, formats: [:html] }
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

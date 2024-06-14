class BookingsController < ApplicationController
  before_action :set_item, only: [:create, :new]
  before_action :set_booking, only: [:show, :edit, :destroy]
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking = @item.bookings.build(booking_params)
    @booking.user = current_user
    @booking.item = @item
    if @booking.save
      redirect_to item_path(@item), notice: "Votre demande de réservation a bien été envoyée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def requests
    @owneritems = Item.where(user: current_user)
    @requests = Booking.where(status: "pending", item: @owneritems) # Comment filtrer aussi sur les owner items?
    
  end


  def edit
  end

  def update
    if @booking.save
      redirect_to item_path(@item), notice: "You have correctly rent the item"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to index_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_booking
    @booking = current_user.booking.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

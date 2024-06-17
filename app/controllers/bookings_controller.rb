class BookingsController < ApplicationController
  before_action :set_item, only: %i[create new]
  before_action :set_booking, only: %i[show update destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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
    @requests = Booking.where(status: "pending", item: @owneritems)
  end

  def update
    @booking.update(status: "confirmed")
    @booking.update(booking_params)
    redirect_to requests_path, notice: "Votre #{@booking.item.name} est réservé(e) du #{@booking.start_date} au #{@booking.end_date}"
  end

  def destroy
    @booking.destroy
    redirect_to requests_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

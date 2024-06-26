class BookingsController < ApplicationController
  before_action :set_item, only: %i[create new]
  before_action :set_booking, only: %i[update destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    @start_date = params[:start_date] || @booking.start_date
    @end_date = params[:end_date] || @booking.end_date
    @users = []
    @users << @booking.item.user
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "bookings/info_window", locals: {user: user}, formats: [:html]),
        marker_html: render_to_string(partial: "bookings/marker", locals: {user: user}, formats: [:html])
      }
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item
    @booking.start_date = params[:booking][:start_date]
    @booking.end_date = params[:booking][:end_date]
    if @booking.save
      redirect_to bookings_path, notice: "Votre demande de réservation a bien été envoyée."
    else
      redirect_to item_path(@item), notice: "Veuillez renseigner des dates"
    end
  end

  def requests
    @owneritems = Item.where(user: current_user)
    @requests = Booking.where(item: @owneritems)
  end

  def update
    @booking.update(status: "confirmed")
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

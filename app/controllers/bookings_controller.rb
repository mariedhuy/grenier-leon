class BookingsController < ApplicationController

  def requests
    @requests = Booking.where(status: "requested") # Il manque la logique de filtre sur les bookings qui concernent les items du user connecté
  end


end

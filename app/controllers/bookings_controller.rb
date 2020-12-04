class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
    @buddy = Buddy.find(params[:buddy_id])
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.buddy = Buddy.find(params[:buddy_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @buddy = Buddy.find(params[:buddy_id])
    @booking.buddy = @buddy
    @booking.user = current_user
    if @booking.save
      redirect_to buddy_booking_path(@booking.id, @buddy)
    else
      render 'buddies/show'
    end
  end

  def checkout
    @booking = Booking.find(params[:buddy_id])
    @total_price = (@booking.end_date - @booking.start_date) * @booking.buddy.price_cents
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to buddy_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

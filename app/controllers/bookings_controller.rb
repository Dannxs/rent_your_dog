class BookingsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.dog.user == current_user
      if params[:commit] == 'Accept'
        @booking.accepted!
      elsif params[:commit] == 'Cancel'
        @booking.cancelled!
      else
        @booking.refused!
      end
      @booking.save
    end
    if @booking.user == current_user && params[:commit] == 'Cancel'
      @booking.cancelled!
    end
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { render json: success_data }
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :status)
  end

  def success_data
    {
      inserted_item: render_to_string(partial: 'pages/pending-request.html', locals: { dog: @booking.dog }),
      history_item: render_to_string(partial: 'pages/request-history.html', locals: { dog: @booking.dog }),
      rental_item: render_to_string(partial: 'pages/rental-request.html')
    }
  end
end

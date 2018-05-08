class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @service_id = params[:format]
    @service_title = Service.find(@service_id).title
    @consultant_id = Service.find(@service_id).user_id
    @consultant_name = Profile.find(@consultant_id).first_name + " " + Profile.find(@consultant_id).last_name 

    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end
  

  # POST /bookings
  # POST /bookings.json
  def create
    
    @service_id = 2
    @consultant_id = Service.find(@service_id).user_id
    @consumer_id = current_user.id


    @booking = Booking.new({
      consultant_id: @consultant_id,
      consumer_id: @consumer_id,
      service_id: @service_id,
      status: "Unconfirmed",
      check_in: booking_params[:check_in],
      checkout: booking_params[:checkout]
    })


    respond_to do |format|
      if @booking.save
        ContactMailer.send_contact_email().deliver_now
        format.html { redirect_to @booking, notice: 'Booking was successfully created. This booking will not be confirmed until the consultant approves it.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit( :check_in, :checkout, :service_id)
    end
end

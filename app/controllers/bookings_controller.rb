class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(consumer_id: current_user).or(Booking.where(consultant_id: current_user))

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

    checkIn = parse_datetime_params booking_params, "check_in", utc_or_local = "AEST"
    checkOut = parse_datetime_params booking_params, "checkout", utc_or_local = "AEST"
    @service_id = params[:booking][:service_id].to_i
    @consultant_id = Service.find(@service_id).user_id
    @consumer_id = current_user.id


    @booking = Booking.new({
      consultant_id: @consultant_id,
      consumer_id: @consumer_id,
      service_id: @service_id,
      status: "Unconfirmed",
      check_in: checkIn,
      checkout: checkOut
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update_attributes(status: 'Accepted')
  
    if @booking.save
      # ContactMailer.send_contact_email(:message => "Accepted").deliver_now
      flash[:notice] =  'Booking was successfully accepted. This booking will not be confirmed until a payment is made.' 
      redirect_to @booking
    else
      format.html { render :new }
      format.json { render json: @booking.errors, status: :unprocessable_entity }
    end
    
  end


   # POST /bookings/1/charge
   def charge
    
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      current_user.stripe_id = customer.id
      current_user.save!
    end

    @booking = Booking.find(params[:id])
  
    Stripe::Charge.create(
      customer:  current_user.stripe_id,
      amount: Service.find(@booking.service_id).price_per_hour,
      description: Service.find(@booking.service.id).title,
      currency: 'aud'
    )

    # current_user.charges << Charge.new(charge_id: charge.id)
    @booking.update_attributes(status: 'Paid')
    if @booking.save
      # ContactMailer.send_contact_email(:message => "Accepted").deliver_now
      flash[:notice] = 'Payment made!'
      redirect_to @booking
    else
      format.html { render :new }
      format.json { render json: @booking.errors, status: :unprocessable_entity }
    end

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_back fallback_location: sneakers_path
  # end

 
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

    # Converts datetime form to Date object
    def parse_datetime_params params, label, utc_or_local = :local
      begin
        year   = params[(label.to_s + '(1i)').to_sym].to_i
        month  = params[(label.to_s + '(2i)').to_sym].to_i
        mday   = params[(label.to_s + '(3i)').to_sym].to_i
        hour   = (params[(label.to_s + '(4i)').to_sym] || 0).to_i
        minute = (params[(label.to_s + '(5i)').to_sym] || 0).to_i
        second = (params[(label.to_s + '(6i)').to_sym] || 0).to_i

        return DateTime.civil_from_format(utc_or_local,year,month,mday,hour,minute,second)
      rescue => e
        return nil
      end
    end
end

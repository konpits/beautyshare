class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    # @services = Service.all
    unless params[:services].present?
      @services = Service.all
    else
      unless params[:services][:category_id].blank?
        search_category = params[:services][:category_id]
        @services = Service.where(category_id: search_category)
      else
        @services = Service.all
      end     
    end
  
  end

  # GET /services/1
  # GET /services/1.json
  def show
    user = @service.user
    @consultant_name  =  Profile.find(user.id).first_name + " " + Profile.find(user.id).last_name 
  end

  # GET /services/new
  def new
    @services = Service.where(user_id: current_user.id)
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:title, :description, :price_per_hour, :min_duration, :max_duration, :image, :user_id, :category_id)
    end
end

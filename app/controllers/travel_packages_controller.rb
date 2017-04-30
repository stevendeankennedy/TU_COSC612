class TravelPackagesController < ApplicationController
  before_action :set_travel_package, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:index, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  # GET /travel_packages
  # GET /travel_packages.json
  def index
    @travel_packages = TravelPackage.all
  end

  # GET /travel_packages/1
  # GET /travel_packages/1.json
  def show
  end

  # GET /travel_packages/new
  def new
    @travel_package = TravelPackage.new
  end

  # GET /travel_packages/1/edit
  def edit
  end

  # POST /travel_packages
  # POST /travel_packages.json
  def create
    @travel_package = TravelPackage.new(travel_package_params)
    myID = session[:user_id]
    @travel_package.user_id = myID

    respond_to do |format|
      if @travel_package.save
        format.html { redirect_to @travel_package, notice: 'Travel package was successfully created.' }
        format.json { render :show, status: :created, location: @travel_package }
      else
        format.html { render :new }
        format.json { render json: @travel_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_packages/1
  # PATCH/PUT /travel_packages/1.json
  def update
    respond_to do |format|
      if @travel_package.update(travel_package_params)
        format.html { redirect_to @travel_package, notice: 'Travel package was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_package }
      else
        format.html { render :edit }
        format.json { render json: @travel_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_packages/1
  # DELETE /travel_packages/1.json
  def destroy
    @travel_package.destroy
    respond_to do |format|
      format.html { redirect_to travel_packages_url, notice: 'Travel package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_package
      @travel_package = TravelPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_package_params
      params.require(:travel_package).permit(:name, :price, :location, :description, :flight_num, :flight_depart, :flight_arrive)
    end
    
    # before filters ------------------------
    # confirm logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in to view this page."
        redirect_to login_url
      end
    end
    
    # confirm correct user
    def correct_user
      if !logged_in? || current_user.usertype != 1
        flash[:warning] = "You cannot access this page"
        redirect_to root_url
      end
    end
end

class TravelPackagesController < ApplicationController
  before_action :set_travel_package, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:index, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  # GET /travel_packages
  # GET /travel_packages.json
  def index
    if current_user.usertype == 2
      @travel_packages = TravelPackage.where(active: true)
    else
      @travel_packages = TravelPackage.allForID(session[:user_id])
    end
  end

  # GET /travel_packages/1
  # GET /travel_packages/1.json
  def show
    @agent = User.find(@travel_package.user_id)
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
    @travel_package.active = true

    if @travel_package.save
      flash[:success] = 'Travel package was successfully created.'
      redirect_to travel_packages_url(@travel_package)
    else
      render 'new'
    end
  end

  # PATCH/PUT /travel_packages/1
  # PATCH/PUT /travel_packages/1.json
  def update
    if @travel_package.update(travel_package_params)
      # Successful update
      flash[:success] = "Updated successfully."
      redirect_to @travel_package
    else # not successful :(
      render :edit
    end
  end


  # DELETE /travel_packages/1
  # DELETE /travel_packages/1.json
  # doesn't actually destroy the object, since the data is used for historical records
  def destroy
    # @travel_package.destroy
    # flash[:success] = "Package successfully deleted."
    @travel_package.active = false
    if @travel_package.save
      flash[:success] = 'Travel package was successfully deleted.'
    else
      flash[:danger] = 'Unable to delete.'
    end
    redirect_to travel_packages_url
  end

  def search
    
  end
  
  # Searches on multiply keywords
  def searchresults
    # @travel_packages = TravelPackage.search(params[:search])
    
    @keys = params[:search].split
    @travel_packages = TravelPackage.search(@keys.shift)
    
    @keys.each do |k|
      @r = TravelPackage.search(k)
      @travel_packages = @travel_packages.or(@r)
    end
  end
  
  def searchbyagent
    @travel_packages = TravelPackage.allForID(params[:agent])
    
    render :searchresults
  end

  def confirmation
    # This would need a more complex system, but since we have no actual purchase system
    #   it occurs here as a simple passthrough
    @travel_package = TravelPackage.find(params[:pack])
    @purch = PurchaseHistory.new({amount: @travel_package.price, 
                                  traveller_id: current_user.id, 
                                  agent_id: @travel_package.user_id, 
                                  package_id: @travel_package.id,
                                  location: @travel_package.location,
                                  name: @travel_package.name
    })
    if @purch.save
      @destination = @travel_package.location
      @confirmation = @purch.id
    else
      flash[:danger] = "Sorry, that didn't save..."
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_package
      @travel_package = TravelPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_package_params
      params.require(:travel_package).permit(:name, :price, :location, :description, 
                    :flight_num, :flight_depart, :flight_arrive, :tags,
                    :return_num, :return_depart, :return_arrive,
                    :airport, :returnairport
                    )
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
      if !logged_in? || current_user.usertype < 1
        flash[:warning] = "You cannot access this page"
        redirect_to root_url
      end
    end
end

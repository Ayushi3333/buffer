class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.search(params[:search])
    @buddiesall = Buddy.all
    @markers = @buddiesall.geocoded.map do |buddy|
        {
          lat: buddy.latitude,
          lng: buddy.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { buddy: buddy }),
          image_url: helpers.asset_url("https://i.imgur.com/SUfRG3j.png")
      }
      end
  end

  def show
    @buddy = Buddy.find(params[:id])
    @markers = [{
        lat: @buddy.latitude,
        lng: @buddy.longitude
      }]
  end

  
  def new
    @buddy = Buddy.new
  end

  def create

    @buddy = Buddy.new(buddies_params)
    @buddy.user = current_user
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  private
  
  def buddies_params
    params.require(:buddy).permit(:name, :description,:address, :longitude, :latitude, :photo, tags: [] )
  end
end

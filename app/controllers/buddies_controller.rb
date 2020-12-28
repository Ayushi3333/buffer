class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.search(params[:search])
    @buddiesall = policy_scope(Buddy).all.order(created_at: :desc)
    if params[:query].present?
      @markers = @buddiesall.near(params[:query]).geocoded.map do |buddy|
        {
          lat: buddy.latitude,
          lng: buddy.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { buddy: buddy })
        }
      end
    else
      @markers = @buddiesall.geocoded.map do |buddy|
        {
          lat: buddy.latitude,
          lng: buddy.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { buddy: buddy }),
          image_url: helpers.asset_url("https://i.imgur.com/SUfRG3j.png")
        }
      end
    end
    if params[:query].present?
      @buddies = Buddy.near(params[:query])
    else
      @buddies = Buddy.all
    end
  end

  def show
    @buddy = Buddy.find(params[:id])
    
    @booking = Booking.new
    @markers = [{
        lat: @buddy.latitude,
        lng: @buddy.longitude
      }]
    @review = Review.new
    @chatroom = Chatroom.find_by(name: @buddy.name)
    authorize @buddy
  end

  def new
      @buddy = Buddy.new
      authorize @buddy
  end

  def create
    @buddy = Buddy.new(buddies_params)
    @chatroom = Chatroom.create(name: @buddy.name)
    @buddy.user = current_user
    @buddy.user.is_buddy = true
    @buddy.user.save!
    # authorize @chartoom
    authorize @buddy
    if @buddy.save!
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def edit
    @buddy = Buddy.find(params[:id])
    authorize @buddy
  end

  def update
    @buddy = Buddy.find(params[:id])
    @buddy.update(buddies_params)
    authorize @buddy
    redirect_to buddy_path(@buddy)
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
    @buddy.user.is_buddy = false
    @buddy.user.save!
    redirect_to root_path
    authorize @buddy
  end

  private

  def buddies_params
    params.require(:buddy).permit(:name, :description, :address, :longitude, :latitude, :price_cents, :user_id, photos: [], tags: [])
  end
end

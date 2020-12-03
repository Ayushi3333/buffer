class BuddiesController < ApplicationController
  def index
      @buddies = Buddy.search(params[:search])
  end

  def show
    @buddy = Buddy.find(params[:id])
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
    params.require(:buddy).permit(:name, :description, :price_cents, photos: [], tags: [])
  end
end

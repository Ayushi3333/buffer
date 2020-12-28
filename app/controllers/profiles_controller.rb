class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @bookings = @profile.user.bookings
    @requests = Buddy.find_by(user_id: @profile.user.id).bookings
    # @buddy = Buddy.find(user_id: @profile.user)

    authorize @profile
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    authorize @profile
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:description, :buddy_name, :name, :photo)
  end
end

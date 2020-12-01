class BuddiesController < ApplicationController
  def index
      @buddies = Buddy.search(params[:search])
  end

  def show
    @buddy = Buddy.find(params[:id])
  end

  
end

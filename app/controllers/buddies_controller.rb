class BuddiesController < ApplicationController
  def index
      @buddies = Buddy.search(params[:search])
  end

  
end

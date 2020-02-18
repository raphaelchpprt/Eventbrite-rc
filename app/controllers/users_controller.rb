class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    signedinuserprofile
    @events = current_user.events
  end

  def signedinuserprofile
    profile = User.find(current_user.id)
    if profile.nil?
      redirect_to "/profile/new"
    end
  end
end

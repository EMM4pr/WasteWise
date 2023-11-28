class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @locations = Location.all
    if user_signed_in?
    @waste_items = current_user.waste_items
    @users = current_user.waste_items
    end
  end
end

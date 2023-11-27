class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @locations = Location.all
    @waste_items = current_user.waste_items
    @users = current_user.username
  end
end

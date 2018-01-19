class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @favorites = current_user.recipes
    @dislikes = current_user.recipes.where(dislike: true)
  end
  
end

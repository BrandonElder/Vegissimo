class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @favorites = current_user.recipes.where(dislike: false)
    @dislikes = current_user.recipes.where(dislike: true)
    @user = current_user
  end
end

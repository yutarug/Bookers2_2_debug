class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:followee_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end
end

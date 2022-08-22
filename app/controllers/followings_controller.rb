class FollowingsController < ApplicationController
  def create
    user = params[:followed_id]
    current_user.active_followings.create(followed_id: user)
    redirect_to user_path(user)
  end

  def destroy
    user = Following.find(params[:id]).followed
    current_user.active_followings.find_by(followed_id: user.id).destroy
    redirect_to user_path(user)
  end
end

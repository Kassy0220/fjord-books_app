# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    if @users.empty?
      @zero_followings_message = t('views.common.zero_followings', user_name: @user.name)
      render 'show_follow'
    else
      render 'show_follow'
    end
  end
end

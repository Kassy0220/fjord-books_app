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
    @users = @user.followings.order('followings.created_at desc')

    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order('followings.created_at desc')

    render 'show_follower'
  end
end

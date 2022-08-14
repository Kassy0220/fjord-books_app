# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).eager_load(icon_attachment: :blob).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end

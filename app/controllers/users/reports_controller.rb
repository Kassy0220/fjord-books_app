# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reports = @user.reports.order(id: 'DESC').page(params[:page]).per(10)
  end
end

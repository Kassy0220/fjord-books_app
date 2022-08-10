# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  protected
  def after_sign_up_path_for(resource)
    books_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end

# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  include Matestack::Ui::Core::ApplicationHelper

  # GET /resource/sign_in
  def new
    responder_for(Pages::StaticApp::SignIn)
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    return user_dashboard_path
  end

end

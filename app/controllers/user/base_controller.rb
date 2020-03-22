class User::BaseController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper

  # devise shut off for demo purposes
  # before_action :authenticate_user!
end

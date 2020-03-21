class User::BaseController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper

  before_action :authenticate_user!
end

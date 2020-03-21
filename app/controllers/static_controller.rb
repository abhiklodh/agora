class StaticController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper

  def welcome
    responder_for(Pages::StaticApp::Welcome)
  end

end

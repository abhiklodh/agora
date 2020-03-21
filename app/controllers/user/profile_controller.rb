class User::ProfileController < User::BaseController

  def display
    responder_for(Pages::UserApp::Profile)
  end

  def update
  end

  protected

end

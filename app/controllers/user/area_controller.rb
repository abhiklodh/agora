class User::AreaController < User::BaseController

  def dashboard
    responder_for(Pages::UserApp::Dashboard)
  end

end

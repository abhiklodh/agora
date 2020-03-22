class User::AreaController < User::BaseController

  def dashboard
    responder_for(Pages::UserApp::Dashboard)
  end

  def switch
    return 200
  end

end

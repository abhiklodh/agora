class User::ItemsController < User::BaseController

  def show
    responder_for(Pages::UserApp::Items::Show)
  end

end

class User::ChatController < User::BaseController

  def index
    responder_for(Pages::UserApp::Chats::Index)
  end

end

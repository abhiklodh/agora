class User::ChatsController < User::BaseController

  def index
    responder_for(Pages::UserApp::Chats::Index)
  end

  def show
    responder_for(Pages::UserApp::Chats::Show)
  end

  def new
    responder_for(Pages::UserApp::Chats::New)
  end

end

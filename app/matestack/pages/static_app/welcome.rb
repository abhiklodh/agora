class Pages::StaticApp::Welcome < Matestack::Ui::Page

  def response
    components {
      heading text: 'Agora'
      transition path: :new_user_session_path, class: 'blue-button', text: 'Einloggen'
    }
  end

end

class Pages::UserApp::ExamplePage < Matestack::Ui::Page

  def response
    components {
      div do
        plain "please create an account"
        link path: :new_user_registration_path, text: 'Sign up'
      end
    }
  end

end

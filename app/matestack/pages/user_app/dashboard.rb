class Pages::UserApp::Dashboard < Matestack::Ui::Page

  def prepare
  end

  def response
    components {
      heading text: 'Welcome to the Marktplatz'
    }
  end

end

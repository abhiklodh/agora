class Pages::UserApp::Profile < Matestack::Ui::Page

  def response
    components {
      heading text: 'Mein Account'
    }
  end

end

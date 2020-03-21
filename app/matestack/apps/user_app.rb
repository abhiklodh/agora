class Apps::UserApp < Matestack::Ui::App

  def response
    components {
      header do
        heading size: 1, text: "User App"
      end
      main do
        page_content
      end
    }
  end

end

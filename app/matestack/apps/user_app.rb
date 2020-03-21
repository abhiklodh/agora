class Apps::UserApp < Matestack::Ui::App

  def response
    components {
      main class: 'container-fluid pl-0' do
        div class: 'row' do
          div class: 'col-md-2' do
            custom_navbar
          end
          div class: 'col-md-9 offset-md-1' do
            custom_user_hero
            page_content
          end
        end
      end
      custom_footer
    }
  end

end

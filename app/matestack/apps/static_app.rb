class Apps::StaticApp < Matestack::Ui::App

  def response
    components {
      main class: 'container-fluid' do
        div class: 'row' do
          div class: 'col-md-12' do
            page_content
          end
        end
      end
      custom_footer
    }
  end

end

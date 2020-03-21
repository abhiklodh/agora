class Components::Hero < Matestack::Ui::StaticComponent

  def response
    components {
      div class: 'pt-4 pb-5 pl-5 pr-5 row' do
        div class: 'col-8' do
          transition path: :root_path do
            img path: "agora_logo.png", class: 'static-hero-logo'
          end
        end
        div class: 'col-4 pr-5 pt-2 text-right' do
          transition path: :new_user_session_path, class: 'blue-button', text: 'Einloggen'
        end
      end
    }
  end

end

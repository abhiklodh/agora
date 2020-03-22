class Components::Footer < Matestack::Ui::StaticComponent

  def prepare
    @supporters = [
      'Verband deutscher Ärzte',
      'Deutsche Krankenhausgesellschaft e.V.',
      'AOK Baden-Württemberg'
    ]
  end

  def response
    components {
      footer class: 'footer ' do
        div class: 'row' do
          div class: 'col-md-12' do
            link path: :user_dashboard_path do
              img path: "agora_logo.png", class: 'mb-4 footer-logo'
            end
          end
          div class: 'col-md-3' do
            transition path: :user_dashboard_path, class: 'fat-footer-link', text: 'Über uns'
            br
            transition path: :user_dashboard_path, class: 'fat-footer-link', text: 'FAQ'
            br
            transition path: :user_dashboard_path, class: 'fat-footer-link', text: 'Kontakt'
            br
            transition path: :user_dashboard_path do
              img path: 'logos/linkedin.svg', class: 'social-icons'
            end
            transition path: :user_dashboard_path do
              img path: 'logos/facebook.svg', class: 'social-icons'
            end
            transition path: :user_dashboard_path do
              img path: 'logos/instagram.svg', class: 'social-icons'
            end
            transition path: :user_dashboard_path do
              img path: 'logos/twitter.svg', class: 'social-icons'
            end
          end
          div class: 'col-md-3' do
            paragraph do
              link path: :user_dashboard_path, class: 'thin-footer-link', text: 'Tipps für Ihre Sicherheit'
            end
            paragraph do
              link path: :user_dashboard_path, class: 'thin-footer-link', text: 'Wichtige Kontaktdaten'
            end
            paragraph do
              link path: :user_dashboard_path, class: 'thin-footer-link', text: 'Datenschutzerklärung'
            end
            paragraph do
              link path: :user_dashboard_path, class: 'thin-footer-link', text: 'Nutzungsbedingungen'
            end
            paragraph do
              link path: :user_dashboard_path, class: 'thin-footer-link', text: 'Impressum'
            end
          end
          div class: 'col-md-6' do
            heading size: 4, class: 'bold', text: 'Unterstützt von'
            div class: 'row' do
              @supporters.each do |supporter|
                div class: 'col-3' do
                  span class: 'small-text', text: supporter
                end
              end
            end
          end
        end
      end
    }
  end

end

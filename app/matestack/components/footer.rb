class Components::Footer < Matestack::Ui::StaticComponent

  def response
    components {
      footer class: 'footer fixed-bottom' do
        div class: 'row' do
          div class: 'col-md-12' do
            plain 'Logo'
          end
          div class: 'col-md-3' do
            transition path: :root_path, text: 'Über uns'
            br
            transition path: :root_path, text: 'FAQ'
            br
            transition path: :root_path, text: 'Kontakt'
            br
            transition path: :root_path, text: 'in'
            transition path: :root_path, text: 'F'
            transition path: :root_path, text: 'IG'
            transition path: :root_path, text: 'TW'
          end
          div class: 'col-md-3' do
            paragraph do
              transition path: :root_path, text: 'Tipps'
            end
            paragraph do
              transition path: :root_path, text: 'Wichtige Kontaktdaten'
            end
            paragraph do
              transition path: :root_path, text: 'Datenschutzerklärung'
            end
            paragraph do
              transition path: :root_path, text: 'Nutzungsbedingungen'
            end
            paragraph do
              transition path: :root_path, text: 'Impressum'
            end
          end
          div class: 'col-md-6' do
            heading size: 3, text: 'Unterstützt von'
            span text: 'Verband deutscher Ärzte'
            br
            span text: 'Deutsche Krankenhausgesellschaft e.V.'
            br
            span text: 'AOK Baden-Württemberg'
          end
        end
      end
    }
  end

end

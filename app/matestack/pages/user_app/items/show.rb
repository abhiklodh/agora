class Pages::UserApp::Items::Show < Matestack::Ui::Page

  def prepare
    @request = {
      :name => "Charité Berlin", :type => "Krankenhaus", :date => "20.03.2020", :time => "20:43", :location => "Berlin, Wedding", :identifier => 'Y8H4Z',
      :items => [
        { :name => "Mundschutz", :amount => 450, :state => 'open' },
        { :name => "Desinfektionsmittel", :amount => 40, :state => 'open' },
        { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
        { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'closed' },
        { :name => "Krankenbett", :amount => 2, :state => 'closed' },
        { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
      ]
    }

    @links = {
      request.path => "Detailansicht ##{@request[:identifier]}"
    }
  end

  def response
    components {
      custom_breadcrumb links: @links

      heading size: 2, class: 'mt-3 mb-4', text: "Detailansicht ##{@request[:identifier]}"


      div class: 'pl-3 row' do
        div class: 'col-2' do
          strong text: @request[:name]
          br
          plain @request[:type]
        end
        div class: 'col-5' do
          span class: 'tiny', text: @request[:location]
          br
          span class: 'tiny', text: "#{@request[:time]}, #{@request[:date]}"
        end
      end

      div class: 'row mt-5' do
        div class: 'col-2' do
          plain 'Status'
        end
        div class: 'col-2' do
          plain 'Kategorie'
        end
        div class: 'col-4' do
          plain 'Artikelname'
        end
        div class: 'col-1' do
          plain 'Menge'
        end
      end
      @request[:items].each do |item|
        div class: 'mt-3 shadowed-bg-white items chat-window row' do
          div class: 'col-2' do
            span class: 'tiny d-inline-block' do
              span class: "status-circle mr-2 status-open" if item[:state] == 'open'
              plain 'Ungelöst' if item[:state] == 'open'
              span class: "status-circle mr-2 status-requested" if item[:state] == 'requested'
              plain 'In Bearbeitung' if item[:state] == 'requested'
              span class: "status-circle mr-2 status-closed" if item[:state] == 'closed'
              plain 'Gelöst' if item[:state] == 'closed'
            end
          end
          div class: 'col-3 ml-3 pl-5' do
            plain item[:name]
          end
          div class: 'col-5 pl-4' do
            plain item[:name]
          end
          div class: 'col-1 pl-5' do
            plain item[:amount]
          end
        end
      end

      div class: 'mt-3 mb-5 pb-5 chat-window text-right' do
        transition path: :new_user_chat_path, class: 'blue-button', text: 'Kontakt aufnehmen'
      end

    }
  end

end

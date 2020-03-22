class Pages::UserApp::Dashboard < Matestack::Ui::Page

  include Matestack::Ui::Core::Collection::Helper

  def prepare
    open_offers_id = "open-offer-collection"
    open_requests_id = "open-request-collection"

    current_filter = get_collection_filter(open_offers_id)
    current_filter = get_collection_filter(open_requests_id)

    # faked input
    open_offers = [
      { :name => "Sanitätshaus Krüger", :type => "Zulieferer", :date => "16.03.2020", :time => "16:13", :location => "Berlin, Moabit",
        :items => [
          { :name => "Mundschutz", :amount => 33, :state => 'closed' },
          { :name => "Desinfektionsmittel", :amount => 2, :state => 'requested' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Krankenbett", :amount => 7, :state => 'closed' },
          { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
        ]
      },
      { :name => "Dr. Jürgen Walthers", :type => "Arztpraxis", :date => "19.03.2020", :time => "10:25", :location => "Berlin, Kreuzberg",
        :items => [
          { :name => "Mundschutz", :amount => 450, :state => 'open' },
          { :name => "Desinfektionsmittel", :amount => 40, :state => 'open' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'closed' }
        ]
      },
      { :name => "Charité Berlin", :type => "Krankenhaus", :date => "18.03.2020", :time => "18:47", :location => "Berlin, Wedding",
        :items => [
          { :name => "Mundschutz", :amount => 33, :state => 'closed' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'open' },
          { :name => "Krankenbett", :amount => 7, :state => 'closed' },
          { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
        ]
       }
    ]
    open_requests = [
      { :name => "Charité Berlin", :type => "Krankenhaus", :date => "20.03.2020", :time => "20:43", :location => "Berlin, Wedding",
        :items => [
          { :name => "Mundschutz", :amount => 450, :state => 'open' },
          { :name => "Desinfektionsmittel", :amount => 40, :state => 'open' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'closed' },
          { :name => "Krankenbett", :amount => 2, :state => 'closed' },
          { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
        ]
      },
      { :name => "St. Hedwig", :type => "Krankenhaus", :date => "19.03.2020", :time => "05:56", :location => "Berlin, Mitte",
        :items => [
          { :name => "Mundschutz", :amount => 450, :state => 'open' },
          { :name => "Desinfektionsmittel", :amount => 40, :state => 'open' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'closed' },
          { :name => "Krankenbett", :amount => 2, :state => 'closed' },
          { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
        ]
      },
      { :name => "Altona-Höfe Hamburg", :type => "Altenheim", :date => "18.03.2020", :time => "17:12", :location => "Hamburg, Altona",
        :items => [
          { :name => "Mundschutz", :amount => 33, :state => 'closed' },
          { :name => "Desinfektionsmittel", :amount => 2, :state => 'requested' },
          { :name => "Schutzhandschuhe", :amount => 6, :state => 'requested' },
          { :name => "Kochsalzlösung, 400ml", :amount => 90, :state => 'open' },
          { :name => "Krankenbett", :amount => 7, :state => 'closed' },
          { :name => "Beatmungsgerät", :amount => 9, :state => 'open' }
        ]
       }
    ]

    @my_open_offers = set_collection({
      id: open_offers_id,
      data: open_offers
    })

    @my_open_requests = set_collection({
      id: open_requests_id,
      data: open_requests
    })
  end

  def response
    components {
      heading size: 2, class: 'mt-3 mb-4' do
        action show_offers_config do
          plain 'Angebote'
        end
        span class: 'pr-4'
        action show_requests_config do
          plain 'Gesuche'
        end
      end

      div class: 'row' do
        div class: 'col-8' do
          async show_on: "show_offers_success", hide_on: "show_requests_success", init_show: true do
            # partial :offers_filter
            async rerender_on: "open-offer-collection-update" do
              partial :offer_content
            end
          end

          async show_on: "show_requests_success", hide_on: "show_offers_success", init_show: false do
            # partial :requests_filter
            async rerender_on: "open-request-collection-update" do
              partial :request_content
            end
          end
        end
      end
    }
  end

  def offers_filter
    partial {
      collection_filter @my_open_offers.config do
        partial :collection_filter
      end
    }
  end

  def requests_filter
    partial {
      collection_filter @my_open_requests.config do
        partial :collection_filter
      end
    }
  end

  def collection_filter
    partial {
      collection_filter_input key: :name, type: :text, placeholder: "Suchbegriff"
      collection_filter_input key: :type, type: :text, placeholder: "Kategorie"
      collection_filter_input key: :location, type: :text, placeholder: "Ort"
      collection_filter_submit do
        button class: 'mt-3 mb-3 blue-button', text: 'Filtern'
      end
    }
  end

  def offer_content
    partial {
      collection_content @my_open_offers.config do
        @my_open_offers.data.each do |offer|
          div class: 'mt-2 mb-2 pt-3 pb-3 pr-3 pl-3 shadowed-bg-white' do
            div class: 'row' do
              div class: 'col-3' do
                strong text: offer[:name]
                br
                plain offer[:type]
                br
                span class: 'tiny', text: "#{offer[:time]}, #{offer[:date]}"
                br
                span class: 'tiny', text: "#{offer[:location]}"
              end
              div class: 'col-7' do
                offer[:items].each do |item|
                  span class: 'tiny mr-3 d-inline-block' do
                    span class: "status-circle #{'status-open' if item[:state] == 'open'} #{'status-requested' if item[:state] == 'requested'} #{'status-closed' if item[:state] == 'closed'}"
                    plain " #{item[:name]} (#{item[:amount]})"
                  end
                end
              end
              div class: 'col-2' do
                link path: :user_dashboard_path, class: 'mt-2 mb-2 rounded-blue-button', text: 'Kontaktieren'
                link path: :user_dashboard_path, class: 'rounded-dark-button', text: 'Details'
              end
            end
          end
        end
      end
    }
  end

  def request_content
    partial {
      collection_content @my_open_requests.config do
        @my_open_requests.data.each do |request|
          div class: 'mt-2 mb-2 pt-3 pb-3 pr-3 pl-3 shadowed-bg-white' do
            div class: 'row' do
              div class: 'col-3' do
                strong text: request[:name]
                br
                plain request[:type]
                br
                span class: 'tiny', text: "#{request[:time]}, #{request[:date]}"
                br
                span class: 'tiny', text: "#{request[:location]}"
              end
              div class: 'col-7' do
                request[:items].each do |item|
                  span class: 'tiny mr-3 d-inline-block' do
                    span class: "status-circle #{'status-open' if item[:state] == 'open'} #{'status-requested' if item[:state] == 'requested'} #{'status-closed' if item[:state] == 'closed'}"
                    plain " #{item[:name]} (#{item[:amount]})"
                  end
                end
              end
              div class: 'col-2' do
                link path: :user_dashboard_path, class: 'mt-2 mb-2 rounded-blue-button', text: 'Kontaktieren'
                link path: :user_dashboard_path, class: 'rounded-dark-button', text: 'Details'
              end
            end
          end
        end
      end
    }
  end

  def show_offers_config
   return {
     method: :post,
     path: :user_dashboard_switch_path,
     success: {
       emit: 'show_offers_success'
     }
   }
 end

  def show_requests_config
   return {
     method: :post,
     path: :user_dashboard_switch_path,
     success: {
       emit: 'show_requests_success'
     }
   }
 end


end

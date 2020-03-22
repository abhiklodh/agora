class Pages::UserApp::Chats::New < Matestack::Ui::Page

  def prepare
    @user = User.first
    @request = {
      :name => "Charité Berlin", :type => "Krankenhaus", :date => "20.03.2020", :time => "20:43", :location => "Berlin, Wedding",
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
      :user_items_show_path => 'Detailansicht',
      request.path => "Kontakt aufnehmen"
    }

  end

  def response
    components {
      custom_breadcrumb links: @links

      heading size: 2, class: 'mt-3 mb-4', text: "Kontakt aufnehmen"
      paragraph text: 'Nehmen Sie Kontakt auf und klicken Sie an, welche Nachfrage Sie bedienen können.'


      form form_config, :include do
        div class: 'pl-3 row' do
          div class: 'col-2' do
            strong text: @request[:name]
            br
            plain @request[:type]
          end
          div class: 'col-5 new_message_checkboxes' do
            @request[:items].each do |item|
              form_select id: :some_id, key: :some_data, type: :checkbox, options: ["#{item[:name]} (#{item[:amount]})"]
            end
          end
        end


        div class: 'mt-5 shadowed-bg-white chat-window row' do
          form_input id: 'new_message', key: :text, type: :text, placeholder: 'Bitte geben Sie hier Ihre Nachricht ein (nicht mehr als 500 Zeichen)'
        end
        div class: 'mt-3' do

          paragraph text: 'Mit dem Versand meiner Nachricht stimme ich den Nutzungsbedingungen und der Datenschutzerklärung zu.'

        end
        div class: 'mt-3 mb-5 pb-5 chat-window text-right' do
          form_submit do
            button class: 'blue-button', text: 'Senden', disabled: true
          end
        end
      end

    }
  end

  private

  def form_config
    {
      for: :message,
      method: :post,
      path: :user_dashboard_switch_path,
      params: {
        user_id: @user.id
      },
      success: { emit: "sending_succeeded" },
      failure: { emit: "sending_failed" }
    }
  end

end

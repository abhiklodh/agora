class Pages::UserApp::Chats::Index < Matestack::Ui::Page
  include Matestack::Ui::Core::Collection::Helper

  def prepare
    @user = current_user
    @requests = Chat.where(recipient_id: @user.id)
    @offers = Chat.where(sender_id: @user.id)

    @my_requests = set_collection({
      id: 'my_requests-collection',
      data: @requests
    })

    @my_offers = set_collection({
      id: 'my_offers-collection',
      data: @offers
    })

    @links = {
      request.path => 'Meine Nachrichten'
    }
  end

  def response
    components {
      custom_breadcrumb links: @links

      heading size: 2, class: 'mt-3 mb-4', text: 'Meine Nachrichten'

      unless @my_requests.data.empty?
        heading size: 3, text: 'Deine Anfragen'
        async rerender_on: "my_requests-collection-update" do
          partial :requests_content
        end
      end
      unless @my_offers.data.empty?
        heading size: 3, text: 'Deine Angebote'
        async rerender_on: "my_offers-collection-update" do
          partial :offers_content
        end
      end
    }
  end

  def requests_content
    partial {
      collection_content @my_requests.config do
        div class: 'row' do

          @my_requests.data.each do |request|
            div class: 'col-md-7' do
              transition path: :user_chat_path, params: {id: request.id} do
                partial :pseudo_card, content: request
              end
            end
            div class: 'col-md-3' do
              action my_request_action_config(request.id) do
                img path: "icons/trashcan.svg", class: 'pt-4'
              end
            end
          end

        end
      end
    }
  end

  def offers_content
    partial {
      collection_content @my_offers.config do
        div class: 'row' do

          @my_offers.data.each do |offer|
            div class: 'col-md-7' do
              transition path: :user_chat_path, params: {id: offer.id} do
                partial :pseudo_card, content: offer
              end
            end
            div class: 'col-md-3' do
              action my_offer_action_config(offer.id) do
                img path: "icons/trashcan.svg", class: 'pt-4'
              end
            end
          end

        end
      end
    }
  end

  def my_request_action_config id
    {
      method: :delete,
      path: :user_chat_path,
      params:{
        id: id
      },
      success: {
        emit: "my_requests-collection-update"
      }
    }
  end

  def my_offer_action_config id
    {
      method: :delete,
      path: :user_chat_path,
      params:{
        id: id
      },
      success: {
        emit: "my_offers-collection-update"
      }
    }
  end

  def pseudo_card item
    partial {
      div class: 'message-preview shadowed-bg-white' do
        heading size: 4, text: "#{item[:content][:created_at].strftime('%e.%m.%y - %H:%M')}"
      end
    }
  end

end

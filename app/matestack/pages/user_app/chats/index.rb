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

  end

  def response
    components {
      heading text: 'Meine Nachrichten'

      heading size: 2, text: 'Deine Anfragen'
      async rerender_on: "my_requests-collection-update" do
        partial :requests_content
      end

      heading size: 2, text: 'Deine Angebote'
      async rerender_on: "my_offers-collection-update" do
        partial :offers_content
      end
    }
  end

  def requests_content
    partial {
      collection_content @my_requests.config do

        @my_requests.data.each do |request|
          partial :pseudo_card, content: request
          transition path: :user_chat_path, params: {id: request.id}, text: 'Details'
          action my_request_action_config(request.id) do
            button text: "delete"
          end
        end

      end
    }
  end

  def offers_content
    partial {
      collection_content @my_offers.config do

        @my_offers.data.each do |offer|
          partial :pseudo_card, content: offer
          transition path: :user_chat_path, params: {id: offer.id}, text: 'Details'
          action my_offer_action_config(offer.id) do
            button text: "delete"
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
      heading size: 4, text: item[:content][:created_at]
    }
  end

end

class Pages::UserApp::Chats::Index < Matestack::Ui::Page

  def prepare
    @user = current_user
    @requests = Chat.where(recipient_id: @user.id)
    @offers = Chat.where(sender_id: @user.id)
  end

  def response
    components {
      heading text: 'Meine Nachrichten'

      heading size: 2, text: 'Deine Anfragen'
      @requests.each do |request|
        partial :pseudo_card, content: request
      end

      heading size: 2, text: 'Deine Angebote'
      @offers.each do |offer|
        partial :pseudo_card, content: offer
      end
    }
  end

  def pseudo_card item
    partial {
      heading size: 4, text: item[:content][:created_at]
    }
  end

end

class Pages::UserApp::Chats::Show < Matestack::Ui::Page

  def prepare
    @user = User.first
    @chat = Chat.find_by(id: params[:id])
    if @user.id == @chat.recipient.id
      @partner = User.find_by(id: @chat.sender_id)
    else
      @partner = User.find_by(id: @chat.recipient_id)
    end
    @messages = Message.where(chat_id: @chat[:id])

    @links = {
      :user_chats_path => 'Meine Nachrichten',
      request.path => "Chat #{@chat.id}"
    }

  end

  def response
    components {
      custom_breadcrumb links: @links

      heading size: 2, class: 'mt-3 mb-4', text: "Chat mit #{@partner.first_name} #{@partner.last_name}"

      div class: 'shadowed-bg-white chat-window row' do
        @messages.each do |message|
          div class: 'col-md-12' do
            if message.user_id == @user.id
              div class: 'own-message message text-right' do
                partial :message_card, message, true
              end
            else
              div class: 'their-message message pull-left' do
                partial :message_card, message, false
              end
            end
          end
        end
      end

      form form_config, :include do
        div class: 'mt-5 shadowed-bg-white chat-window row' do
          form_input id: 'new_message', key: :text, type: :text, placeholder: 'Neue Nachricht schreiben'
        end
        div class: 'mt-3 mb-5 pb-5 chat-window text-right' do
          form_submit do
            button class: 'blue-button', text: 'Senden', disabled: true
          end
        end
      end

    }
  end

  def message_card (item, yourself)
    partial {
      paragraph text: item[:text]
      span class: 'message-sender' do
        plain "#{@user.first_name} #{@user.last_name}, " if yourself == true
        plain "#{@partner.first_name} #{@partner.last_name}, " if yourself == false
        plain "#{item[:created_at].strftime('%e.%m.%y - %H:%M')}"
      end
    }
  end

  private

  def form_config
    {
      for: :message,
      method: :post,
      path: :user_chat_create_message_path,
      params: {
        user_id: @user.id,
        chat_id: @chat.id
      },
      success: { emit: "sending_succeeded" },
      failure: { emit: "sending_failed" }
    }
  end

end

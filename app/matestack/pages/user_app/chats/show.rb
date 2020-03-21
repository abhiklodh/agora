class Pages::UserApp::Chats::Show < Matestack::Ui::Page

  def prepare
    @user = current_user
    @chat = Chat.find_by(id: params[:id])
    @messages = Message.where(chat_id: @chat[:id])
  end

  def response
    components {
      transition path: :user_chats_path, text: 'Zurück zum Postfach'

      heading text: "Chat #{@chat.id}"

      div class: 'col-md-12 shadowed-bg-white chat-window' do
        @messages.each do |message|
          if message.user_id == @user.id
            div class: 'text-right' do
              partial :message_card, content: message
            end
          else
            div class: 'pull-left' do
              partial :message_card, content: message
            end
          end
        end
      end

        form form_config, :include do
        div class: 'mt-5 col-md-12 shadowed-bg-white chat-window' do
          form_input id: 'text', key: :text, type: :text, placeholder: 'Neue Nachricht schreiben'
        end
        div class: 'mt-3 text-right' do
          form_submit do
            button class: 'blue-button', text: 'Absenden'
          end
        end
      end

    }
  end

  def message_card item
    partial {
      paragraph text: item[:content][:text]
      span text: "#{item[:content][:created_at].strftime('%e.%m.%y - %H:%M')}"
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
      success: { transition: { path: :user_dashboard_path } },
      failure: { emit: "login_failed" }
    }
  end

end

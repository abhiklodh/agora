class User::MessageController < User::BaseController

  def create
    @message = Message.new(text: params[:message][:text], chat_id: params[:chat_id], user_id: params[:user_id])
    @message.valid?
    if @message.save
      return 200
    else
      return 500
    end
  end

  protected

  def message_params
    params.require(:message).permit(:text, :chat_id, :user_id)
  end

end

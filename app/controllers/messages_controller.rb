class MessagesController < ApplicationController
  def create

  end

  private
  def message_params
    params.require(:messages).permit(:receiver_id, :content, :chat_room_id)
  end
end

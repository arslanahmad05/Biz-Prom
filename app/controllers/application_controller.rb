class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :chat_rooms
  before_action :message_new
  before_action :comment_new

  def chat_rooms
    sent_messages = current_user.sent_messages.pluck(:chatroom_id)
    received_message = current_user.received_messages.pluck(:chatroom_id)
    ids = sent_messages.concat(received_message).uniq
    @chatrooms = Chatroom.where(id: ids).order(updated_at: :desc)
  end

  def message_new
    @message = Message.new()
  end
  def comment_new
    @comment = Comment.new()
  end
end

class CheckChatroom
  attr_reader :sender_id, :receiver_id

  def initialize(sender_id, receiver_id)
    @sender_id = sender_id
    @receiver_id = receiver_id

    def call
      if ChatRoom.find_by(unique_name: "#{sender_id}-#{receiver_id}")
        return "#{sender_id}-#{receiver_id}"
      elsif ChatRoom.find_by(unique_name: "#{receiver_id}-#{sender_id}")
        return "#{receiver_id}-#{sender_id}"
      else
        return "#{sender_id}-#{receiver_id}"
      end
    end
  end
end
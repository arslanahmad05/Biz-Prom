class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.string :unique_name, null: false, unique: true
      t.timestamps
    end
  end
end

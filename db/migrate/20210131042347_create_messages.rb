class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.integer :sender, null: false
      t.integer :receiver, null: false
      t.boolean :read, :boolean, default: false

      t.timestamps
    end
  end
end

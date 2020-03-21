class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.boolean :resolved, default: false

      t.references :sender, foreign_key: { to_table: 'users' }
      t.references :recipient, foreign_key: { to_table: 'users' }

      t.timestamps
    end
    add_reference :items, :chat, index: true
  end
end

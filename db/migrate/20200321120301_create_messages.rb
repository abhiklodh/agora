class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.boolean :archived, default: false
      t.text :text, default: ''

      t.timestamps
    end
    add_reference :messages, :chat, index: true
    add_reference :messages, :user, index: true

  end
end

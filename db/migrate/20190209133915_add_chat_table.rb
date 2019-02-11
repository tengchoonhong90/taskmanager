class AddChatTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :chats do |t|
      t.string :username
      t.string :message

      t.timestamps
    end
  end
end

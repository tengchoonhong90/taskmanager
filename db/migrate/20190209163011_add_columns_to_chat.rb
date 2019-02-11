class AddColumnsToChat < ActiveRecord::Migration[5.2]
  def change
  	add_reference :chats, :task, foreign_key: true
  end
end

class AddTaskColumnToReputation < ActiveRecord::Migration[5.2]
  def change
  	add_reference :reputations, :task, foreign_key: true
  end
end

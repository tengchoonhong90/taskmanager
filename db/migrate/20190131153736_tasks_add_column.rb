class TasksAddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :confirmed, :boolean
    add_column :tasks, :completed, :boolean
  end
end

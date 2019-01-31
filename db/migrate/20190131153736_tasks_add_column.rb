class TasksAddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :confirmed, :boolean, default: false
    add_column :tasks, :completed, :boolean, default: false
    add_column :tasks, :incomplete, :boolean, default: false
  end
end

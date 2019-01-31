class TasksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_users do |t|
      t.references :task
      t.references :user

      t.timestamps
    end 
  end
end

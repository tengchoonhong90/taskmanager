class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user
      t.text :task_name
      t.string :task_description
      t.datetime :start_time
      t.float :price
      t.boolean :negotiable

      t.timestamps
    end
  end
end
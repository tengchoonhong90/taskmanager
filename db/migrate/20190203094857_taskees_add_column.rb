class TaskeesAddColumn < ActiveRecord::Migration[5.2]
  def change
   	add_column :taskees, :bid, :integer
  end
end

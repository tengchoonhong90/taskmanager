class AddDoneColumnToTaskees < ActiveRecord::Migration[5.2]
  def change
  	add_column :taskees, :done, :boolean, default: false
  end
end

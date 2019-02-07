class AddSelectedColumnToTaskee < ActiveRecord::Migration[5.2]
  def change
  	add_column :taskees, :selected, :boolean, default: false
  end
end

class ChangeLocationIntegerToString < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :location, :string
  end
end

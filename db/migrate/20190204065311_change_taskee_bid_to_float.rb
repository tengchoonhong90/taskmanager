class ChangeTaskeeBidToFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :taskees, :bid, :float
  end
end

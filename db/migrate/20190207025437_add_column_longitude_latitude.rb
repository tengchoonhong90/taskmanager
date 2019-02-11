class AddColumnLongitudeLatitude < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :longitude, :float
    add_column :tasks, :latitude, :float
  end
end

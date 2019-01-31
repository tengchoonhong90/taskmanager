class CreateReputations < ActiveRecord::Migration[5.2]
  def change
    create_table :reputations do |t|
      t.references :user
      t.integer :rep

      t.timestamps
    end
  end
end

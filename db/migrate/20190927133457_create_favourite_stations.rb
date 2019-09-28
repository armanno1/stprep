class CreateFavouriteStations < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_stations do |t|
      t.integer :station_id
      t.integer :user_id

      t.timestamps
    end
  end
end

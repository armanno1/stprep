class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :title
      t.text :description
      t.text :scenario
      t.text :answer
      t.timestamps
    end
  end
end

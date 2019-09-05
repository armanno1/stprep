class RemoveAnswerFromStations < ActiveRecord::Migration[5.2]
  def change
    remove_column :stations, :answer
  end
end

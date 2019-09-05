class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :question
      t.text :answer
      t.integer :station_id
      t.timestamps
    end
  end
end

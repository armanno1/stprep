class DeleteProgresses < ActiveRecord::Migration[5.2]
  def change
    drop_table :progresses

  end
end

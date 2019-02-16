class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end

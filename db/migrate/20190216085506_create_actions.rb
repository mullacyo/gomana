class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :location
      t.json :pictures
      t.integer :duration

      t.timestamps
    end
  end
end

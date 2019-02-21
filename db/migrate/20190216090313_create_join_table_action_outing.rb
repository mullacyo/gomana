class CreateJoinTableActionOuting < ActiveRecord::Migration[5.2]
  def change
    create_table :actions_outings do |t|
      t.integer :action_id, null: false
      t.integer :outing_id, null: false
      t.timestamps
    end
  end
end

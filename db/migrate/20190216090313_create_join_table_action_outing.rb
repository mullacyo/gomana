class CreateJoinTableActionOuting < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actions, :outings do |t|
      t.index [:action_id, :outing_id]
    end
  end
end

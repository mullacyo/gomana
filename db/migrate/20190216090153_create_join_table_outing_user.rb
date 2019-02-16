class CreateJoinTableOutingUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :outings, :users do |t|
      t.index [:outing_id, :user_id]
    end
  end
end

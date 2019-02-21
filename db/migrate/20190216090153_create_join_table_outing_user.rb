class CreateJoinTableOutingUser < ActiveRecord::Migration[5.2]
  def change
    create_table :outings_users do |t|
      t.integer :outing_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

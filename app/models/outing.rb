class Outing < ApplicationRecord
    has_many :actions, through: :actions_outing
    # has_and_belongs_to_many :users, :join_table => "outings_users", :class_name => "OutingUser"
    has_many :outings_users
    has_many :users, through: :outings_users
end

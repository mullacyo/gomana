class Outing < ApplicationRecord
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    
    has_many :actions_outings
    has_many :actions, through: :actions_outings
    # has_and_belongs_to_many :users, :join_table => "outings_users", :class_name => "OutingUser"
    has_many :outings_users
    has_many :users, through: :outings_users
end

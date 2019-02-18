class Action < ApplicationRecord
    has_many :outings, through: :action_outings
end

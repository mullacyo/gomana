class Action < ApplicationRecord
    has_and_belongs_to_many :outings
end

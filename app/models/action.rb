class Action < ApplicationRecord
    has_many :actions_outings, dependent: :destroy
    has_many :outings, through: :actions_outings, dependent: :destroy
end

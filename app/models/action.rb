class Action < ApplicationRecord
    has_many :actions_outings
    has_many :outings, through: :actions_outings
    # scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }
end

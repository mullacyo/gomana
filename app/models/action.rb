class Action < ApplicationRecord
    validates :name, presence: true
    validates :type
    validates :description, presence: true
    validates :location, presence: true
    validates :duration, presence: true

    has_many :actions_outings
    has_many :outings, through: :actions_outings
    # scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }
end

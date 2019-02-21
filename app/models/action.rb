class Action < ApplicationRecord
    has_many :actions_outings
    has_many :outings, through: :actions_outings

    # scope :name, -> (name) {where ("name ILIKE ??", "#{name}")}@
end

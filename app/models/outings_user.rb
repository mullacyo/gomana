class OutingsUser < ApplicationRecord
    belongs_to :outing
    belongs_to :user
end  
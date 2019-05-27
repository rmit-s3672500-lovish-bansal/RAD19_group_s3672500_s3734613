class Location < ApplicationRecord
    has_and_belongs_to_many :course
    validates :venue, presence: true
end

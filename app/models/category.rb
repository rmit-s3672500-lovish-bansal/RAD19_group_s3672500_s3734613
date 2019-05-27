class Category < ApplicationRecord
    has_and_belongs_to_many :course
    validates :title, presence: true
end

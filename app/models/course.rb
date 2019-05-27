class Course < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :location
    has_and_belongs_to_many :category
    default_scope -> { order(created_at: :desc) }
    validates :name, presence: true
    validates :Description, presence: true, length: { maximum: 150 }
end

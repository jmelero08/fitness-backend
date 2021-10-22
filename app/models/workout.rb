class Workout < ApplicationRecord
    belongs_to :user
    validates :name, :description, :user_id, presence: true
end

class User < ApplicationRecord
    has_secure_password
    has_many :workouts

    validates :name, :username, presence: true
    validates :username, uniqueness: true
end

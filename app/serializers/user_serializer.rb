class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :name
  has_many :workouts, serializer: WorkoutSerializer
end

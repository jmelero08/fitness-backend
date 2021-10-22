class Api::V1::WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :update, :destroy]

    def index
      if logged_in?
        @workouts = current_user.workouts
        render json: WorkoutSerializer.new(@workouts)
      else 
        render json: {
          error: "You are not signed in."
        }
      end
    end
  
    def show
      render json: @workout
    end
  
    def create
      @workout = current_user.workouts.build(workout_params)
  
      if @workout.save
        render json:  WorkoutSerializer.new(@workout), status: :created
      else
        error_resp = {
          error: @workout.errors.full_messages.to_sentence
        }
        render json: error_resp, status: :unprocessable_entity
      end
    end
  
    def update
      if @workout.update(workout_params)
        render json:  WorkoutSerializer.new(@workout), status: :ok
      else
        error_resp = {
          error: @workout.errors.full_messages.to_sentence
        }
        render json: error_resp, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @workout.destroy
        render json:  { data: "Workout successfully destroyed" }, status: :ok
      else
        error_resp = {
          error: "Workout not found and not destroyed"
        }
        render json: error_resp, status: :unprocessable_entity
      end
    end
  
    private
      def set_workout
        @workout = Workout.find(params[:id])
      end
  
      def workout_params
        params.require(:workout).permit(:name, :description)
      end
end
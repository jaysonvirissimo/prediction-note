module Api
  class PredictionsController < ApplicationController
    before_action :require_signed_in!, only: [:new, :create]

    def index
      @predictions = Prediction.all
      render json: @predictions
    end

    def undetermined
      @due_for_judgment = Prediction.due_for_judgment
      render json: @due_for_judgment
    end

    def show
      @prediction = Prediction.find(params[:id])
      render json: @prediction
    end
  end
end

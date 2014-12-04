module Api
  class PredictionsController < ApplicationController
    before_action :require_signed_in!, only: [:new, :create]

    def index
      @predictions = Prediction.last(50).reverse
      render json: @predictions
    end

    def undetermined
      @due_for_judgment = Prediction.due_for_judgment.sort_by(&:deadline)
      render json: @due_for_judgment
    end

    def show
      @prediction = Prediction.find(params[:id])
      @judgment = @prediction.judgments.last
      render json: @prediction
    end
  end
end

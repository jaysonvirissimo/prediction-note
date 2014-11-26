class PredictionsController < ApplicationController
  def index
    @predictions = Prediction.all
    render :index
  end

  def new
    render :new
  end

  def create
  end

  def show
  end
end

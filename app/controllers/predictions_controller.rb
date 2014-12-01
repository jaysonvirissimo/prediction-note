class PredictionsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create]

  def index
    @predictions = Prediction.all
    render :index
  end

  def undetermined
    @due_for_judgment = Prediction.due_for_judgment.sort_by(&:deadline)
    render :undetermined
  end

  def new
    render :new
  end

  def create
    @prediction = Prediction.new
    @prediction.statement = params[:prediction][:statement]
    @prediction.deadline = Prediction.parse_datetime(params[:prediction][:deadline])
    @prediction.user_id = current_user.id

    if @prediction.save
      redirect_to prediction_url(@prediction)
    else
      flash[:errors] = @prediction.errors.full_messages
      render :new
    end
  end

  def show
    @prediction = Prediction.find(params[:id])
    render :show
  end
end

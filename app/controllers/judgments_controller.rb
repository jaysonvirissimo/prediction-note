class JudgmentsController < ApplicationController
  def create
    @judgment = current_user.judgments.new
    @judgment.prediction_id = params[:prediction_id]
    @judgment.status = params[:status]
    @judgment.user_id = current_user.id

    if @judgment.save
      if @judgment.status == 'undetermined'
        @judgment.prediction.judged = false
      else
        @judgment.prediction.judged = true
      end

      @judgment.prediction.save

      render json: @judgment
    else
      render json: @judgment.errors.full_messages, status: :unprocessable_entity
    end
  end
end

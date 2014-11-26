class WagersController < ApplicationController
  def create
    @prediction = Prediction.find(wager_params[:prediction_id])
    @wager = current_user.wagers.new(wager_params)
    @wager.user_id = current_user.id

    if @wager.save
      redirect_to prediction_url(@prediction)
    else
      flash[:errors] = @wager.errors.full_messages
      redirect_to predictions_url
    end
  end

  def wager_params
    params.require(:wager).permit(:probability, :prediction_id)
  end
end

class JudgmentsController < ApplicationController
  def create
    # change to judgment variables
    @judgment = current_user.judgments.new(wager_params)
    @judgment.user_id = current_user.id

    if @judgment.save
      # trigger success callback
    else
      # render errors to json
      flash[:errors] = @judgment.errors.full_messages
    end
  end

  def judgment_params
    params.require(:judgment).permit(:status, :prediction_id)
  end
end

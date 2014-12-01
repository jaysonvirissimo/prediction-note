class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to predictions_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @predictions = @user.predictions.limit(5)
    @wagers = @user.wagers.limit(5)
    @judgments = @user.judgments.limit(5)

    render :show
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

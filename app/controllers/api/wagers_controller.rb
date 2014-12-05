module Api
  class WagersController < ApplicationController
    def index
      @wagers = Wager.all
      render json: @wagers
    end
  end
end

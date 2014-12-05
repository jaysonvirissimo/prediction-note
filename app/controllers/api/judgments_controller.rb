module Api
  class JudgmentsController < ApplicationController
    def index
      @judgments = Judgment.all
      render json: @judgments
    end
  end
end

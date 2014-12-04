module Api
  class QuotesController < ApplicationController
    def index
      @quotes = Quote.order('RANDOM()').first(3)
      render json: @quotes
    end

    def show
      @quote = Quote.find(params[:id])
      render json: @quote
    end
  end
end

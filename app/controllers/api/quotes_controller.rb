module Api
  class QuotesController < ApplicationController
    def index
      @quotes = Quote.all
      render json: @quotes
    end
  end
end

module Api
  class QuotesController < ApplicationController
    def index
      @quotes = Quote.order('RANDOM()').first(3)
      render json: @quotes
    end
  end
end

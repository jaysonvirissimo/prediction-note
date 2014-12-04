module Api
  class UsersController < ApplicationController
    def home
      @quotes = Quote.order('RANDOM()').first(3)
      render json: @quotes
    end
  end
end

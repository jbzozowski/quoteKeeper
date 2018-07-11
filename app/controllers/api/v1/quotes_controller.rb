class Api::V1::QuotesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: Quote.all }
    end
  end

  def random
    quote = Quote.order('RANDOM()').limit(1).first
    render :json => quote.as_json(:only => [:quote, :author])
    # render json: quote
  end
end

class Api::V1::QuotesController < ApplicationController
  respond_to :json

  def index
    respond_with Quote.all
  end
end

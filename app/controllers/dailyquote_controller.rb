class DailyQuote < ApiController

  def index
    # need code for choosing random quote
    quotes = Quote.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Presented quote', data: quote}, status: :ok
  end

end

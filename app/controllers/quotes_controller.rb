class QuotesController < ApplicationController
  helper_method :sort_column, :sort_direction

  # USERNAME, PASSWORD = 'jbzozowski', 'bozo'

  before_action :authenticate, except: [:index, :show]

  # GET /quotes
  def index
    @quotes = Quote.search(params[:search]).order(sort_column + " " + sort_direction)
    if @quotes = Kaminari.paginate_array(@quotes).page(params[:page]).per(4)
    else
      @quotes = Quote.page(params[:page]).per(4)
    end
  end

  # GET /quotes/1
  def show
    @quote = Quote.find(params[:id])
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quotes/1
  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quotes/1
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_url, notice: 'Quote was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def quote_params
    params.require(:quote).permit(:quote, :author, :category)
  end

  def authenticate
   authenticate_or_request_with_http_basic do |username, password|
        username == USERNAME && password == PASSWORD
      end
  end

  def sort_column
    Quote.column_names.include?(params[:sort]) ? params[:sort] : "quote"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end

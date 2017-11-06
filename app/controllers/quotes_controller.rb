class QuotesController < ApplicationController
  # GET /quotes
  def index
    @quotes = Quote.search(params[:search]).order(params[:sort])
    if @quotes = Kaminari.paginate_array(@quotes).page(params[:page]).per(7)
    else
      @quotes = Quote.page(params[:page]).per(7)
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
end

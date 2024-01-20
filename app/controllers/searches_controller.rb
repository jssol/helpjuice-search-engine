class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update, :destroy]

  # GET /searches
  def index
    @searches = Search.all
    render json: @searches
  end

  # GET /searches/:id
  def show
    render json: @search
  end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      render json: @search, status: :created
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /searches/:id
  def destroy
    @search.destroy
    head :no_content
  end

  private

  # Callbacks to share setup
  def set_search
    @search = Search.find(params[:id])
  end

  # Filters parameters
  def search_params
    params.require(:search).permit(:query, :ip_address)
  end
end

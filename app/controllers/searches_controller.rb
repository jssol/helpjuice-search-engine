class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :destroy]

  # GET /searches
  def index
    @searches = Search.all

    respond_to do |f|
      f.html # Render HTML
      f.json { render json: @searches } # Respond with JSON
    end
  end

  # GET /searches/:id
  def show
    respond_to do |f|
      f.html # Render HTML
      f.json { render json: @search } # Respond with JSON
    end
  end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      respond_to do |f|
        f.html # Render HTML
        f.json { render json: @search, status: :created } # Respond with JSON
      end
    else
      render json: @search.errors, status: :unprocessable_entity
      respond_to do |f|
        f.html { render html: @search.errors, status: :unprocessable_entity } # Render HTML
        f.json { render json: @search.errors, status: :unprocessable_entity } # Respond with JSON
      end
    end
  end

  # DELETE /searches/:id
  def destroy
    @search.destroy
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

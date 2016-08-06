class SearchesController < ApplicationController

  # POST /searches
  def create
    @search = Search.query(search_params)
    render json: {articles: @search}, status: :ok
  end

  private
    # Only allow a trusted parameter "white list" through.
    def search_params
      params.fetch(:search, {})
    end
end

module Api
  module V1
    class SearchController < ApplicationController

      def index
        if params[:q].nil?
          authors = Author.all
        else
          authors = Author.search(params[:q]).records
          render json: {status: 'HELLYEAH', message: 'uhulll', data:authors}, status: :ok
        end
      end

    end
  end
end

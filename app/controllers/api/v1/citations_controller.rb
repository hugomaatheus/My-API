module Api
  module V1
    class CitationsController < ApplicationController

      def index
        citations = Citation.order('created_at DESC')
        render json: {status: 'HELLYEAH', message:'Citações carregadas', data:citations}, status: :ok
      end

      def show
        citation = Citation.find(params[:id])
        render json: {status: 'HELLYEAH', message:'Citação encontrada', data:citation}, status: :ok
      end

      def create
        citation = Citation.new(params.permit(:m_type))
        author = Author.find(params[:author_id])
        author.citations << citation
        if citation.save
          render json: {status: 'HELLYEAH', message:'Citação criada', data:citation}, status: :ok
        else
          render json: {status: 'ERROR', message:'Citação não pôde ser criada', data:citation.errors}, status: :unprocessable_entity
        end
      end

      def update
        citation = Citation.find(params[:id])
        if citation.update_attributes(citation_params)
          render json: {status: 'HELLYEAH', message:'Citação atualizada', data:citation}, status: :ok
        else
          render json: {status: 'ERROR', message:'Citação não pôde ser atualizada', data:citation.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        citation = Citation.find(params[:id])
        citation.destroy
        render json: {status: 'HELLYEAH', message:'Citação excluída', data:citation}, status: :ok
      end

      private
      def citation_params
        params.permit(:m_type, :author_id)
      end

    end
  end
end

module Api
  module V1
    class AuthorsController < ApplicationController

      def index
        authors = Author.filter(params.slice(:by_m_name))
        render json: {status: 'HELLYEAH', message:'Autores carregados', data:authors}, status: :ok
      end

      def show
        busca = params[:id].present?
        author = Author.search(busca)
        render json: {status: 'HELLYEAH', message:'Autor encontrado', data:author}, status: :ok
      end

      def create
        author = Author.new(author_params)
        if author.save
          render json: {status: 'HELLYEAH', message:'Autor criado', data:author}, status: :ok
        else
          render json: {status: 'ERROR', message:'Autor não pôde ser criado', data:author.errors}, status: :unprocessable_entity
        end
      end

      def update
        author = Author.find(params[:id])
        if author.update_attributes(author_params)
          render json: {status: 'HELLYEAH', message:'Autor atualizado', data:author}, status: :ok
        else
          render json: {status: 'ERROR', message:'Autor não pôde ser atualizado', data:author.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy
        render json: {status: 'HELLYEAH', message:'Autor excluído', data:author}, status: :ok
      end

      private
      def author_params
        params.permit(:name, :age)
      end

    end
  end
end

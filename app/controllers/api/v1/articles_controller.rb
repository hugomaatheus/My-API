module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'HELLYEAH', message:'Artigos carregados', data:articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'HELLYEAH', message:'Artigo encontrado', data:article}, status: :ok
      end

      def create
        article = Article.new(params.permit(:title, :abstract))
        author = Author.find(params[:author_id])
        article.authors << author
        if article.save
          render json: {status: 'HELLYEAH', message:'Artigo criado', data:article}, status: :ok
        else
          render json: {status: 'ERROR', message:'Artigo não pôde ser criado', data:article.errors}, status: :unprocessable_entity
        end
      end

      def update
        article = Article.find(params[:id])
        author = Author.find(params[:author_id])
        article.authors << author

        if article.update_attributes(params.permit(:title, :abstract))
          render json: {status: 'HELLYEAH', message:'Artigo atualizado', data:article}, status: :ok
        else
          render json: {status: 'ERROR', message:'Artigo não pôde ser atualizado', data:article.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'HELLYEAH', message:'Artigo excluído', data:article}, status: :ok
      end

      private
      def article_params
        params.permit(:title, :abstract, :author_id)
      end

    end
  end

end

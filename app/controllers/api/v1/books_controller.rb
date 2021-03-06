module Api
  module V1
    class BooksController < ApplicationController

      def index
        books = Book.order('created_at DESC')
        render json: {status: 'HELLYEAH', message:'Livros carregados', data:books}, status: :ok
      end

      def show
        book = Book.find(params[:id])
        render json: {status: 'HELLYEAH', message:'Livro encontrado', data:book}, status: :ok
      end

      def create
        book = Book.new(params.permit(:title, :abstract))
        author = Author.find(params[:author_id])
        author.books << book
        if book.save
          render json: {status: 'HELLYEAH', message:'Livro criado', data:book}, status: :ok
        else
          render json: {status: 'ERROR', message:'Livro não pôde ser criado', data:book.errors}, status: :unprocessable_entity
        end
      end

      def update
        book = Book.find(params[:id])
        if book.update_attributes(book_params)
          render json: {status: 'HELLYEAH', message:'Livro atualizado', data:book}, status: :ok
        else
          render json: {status: 'ERROR', message:'Livro não pôde ser atualizado', data:book.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: {status: 'HELLYEAH', message:'Livro excluído', data:book}, status: :ok
      end

      private
      def book_params
        params.permit(:title, :abstract, :author_id)
      end

    end
  end
end

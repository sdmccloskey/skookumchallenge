class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      fetch_books

    end

    def show
      set_book
    end

  private

  def parse_books(books)
    JSON.parse(books.body)
  end

  def fetch_books
    @books ||= parse_books(RestClient.get("https://skookum-test-api.herokuapp.com/api/v1/books"))
  end

  def set_book
    @book = fetch_books.detect do |book|
      book['title'].include?(params['title'].gsub('-',' '))
    end
  end





end

class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      response = RestClient.get('https://skookum-test-api.herokuapp.com/api/v1/books')
      @books = JSON.parse(response.body)
    end

    def show
      books_response = RestClient.get("https://skookum-test-api.herokuapp.com/api/v1/books")
      comment_response = RestClient.get("https://skookum-test-api.herokuapp.com/api/v1/books")

      @books = JSON.parse(books_response.body)
      @comments = JSON.parse(comment_response.body)
    end

    def create
      books = params['books']

      response = RestClient.books("https://jsonplaceholder.typicode.com/posts", books)

      books_id = JSON.parse(response)["id"]

      redirect_to books_path(books_id)
    end

    def edit
      # get the value of item by making a call to the API and storing in a variable
      # ie: @post = RestClient.get('endpoint/:id')
    end

    def update
      # @post is already available to you

    end

    def destroy
    end
  end

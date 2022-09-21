# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/books', type: :request do
  let(:valid_attributes) do
    {
      title: Faker::Book.title,
      author: Faker::Book.author,
      category: Faker::Book.genre
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      author: nil,
      category: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Book.create! valid_attributes
      get books_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      book = Book.create! valid_attributes
      get book_url(book)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      book = Book.create! valid_attributes
      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        expect do
          post books_url, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post books_url, params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post books_url, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: Faker::Book.title,
          author: Faker::Book.author,
          category: Faker::Book.genre
        }
      end

      it 'updates the requested book' do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.title).to eq(new_attributes[:title])
      end

      it 'redirects to the book' do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested book' do
      book = Book.create! valid_attributes
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      book = Book.create! valid_attributes
      delete book_url(book)
      expect(response).to redirect_to(books_url)
    end
  end
end

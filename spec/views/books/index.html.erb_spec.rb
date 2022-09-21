# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :view do
  let(:book_one) { create(:book) }
  let(:book_two) { create(:book) }

  before do
    relation = Book.order(:title).page()
    assign(:books, relation)
  end

  xit 'renders a list of books' do
    render

    assert_select 'p>strong', text: 'Title:'.to_s, count: 2
    assert_select 'p>strong', text: 'Author:'.to_s, count: 2
    assert_select 'p>strong', text: 'Category:'.to_s, count: 2
  end
end

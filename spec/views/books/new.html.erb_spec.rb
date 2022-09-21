# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  let(:book) { build(:book) }

  before do
    assign(:book, book)
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[category]'
    end
  end
end

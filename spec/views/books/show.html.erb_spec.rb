require 'rails_helper'

RSpec.describe 'books/show', type: :view do
  let(:book) { create(:book) }

  before do
    @book = assign(:book, book)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Category/)
  end
end

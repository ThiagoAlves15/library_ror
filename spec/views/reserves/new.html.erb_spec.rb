# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reserves/new', type: :view do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:reserve) { build(:reserve) }

  before do
    assign(:reserve, reserve)
    assign(:users_array, [user])
    assign(:books_array, [book])
  end

  it 'renders new reserve form' do
    render

    assert_select 'form[action=?][method=?]', reserves_path, 'post' do
      assert_select 'select[name=?]', 'reserve[book_id]'

      assert_select 'select[name=?]', 'reserve[user_id]'

      assert_select 'select[name=?]', 'reserve[devolution_date(1i)]'
    end
  end
end

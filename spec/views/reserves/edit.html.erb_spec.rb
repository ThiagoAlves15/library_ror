# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reserves/edit', type: :view do
  let(:reserve) { create(:reserve) }

  before do
    assign(:reserve, reserve)
  end

  it 'renders the edit reserve form' do
    render

    assert_select 'form[action=?][method=?]', reserve_path(reserve), 'post' do
      assert_select 'input[name=?]', 'reserve[book_id]'

      assert_select 'input[name=?]', 'reserve[user_id]'

      assert_select 'select[name=?]', 'reserve[devolution_date(1i)]'
    end
  end
end

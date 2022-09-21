require 'rails_helper'

RSpec.describe 'reserves/index', type: :view do
  let(:reserve_one) { create(:reserve) }
  let(:reserve_two) { create(:reserve) }

  before do
    assign(:reserves, [reserve_one, reserve_two])
  end

  it 'renders a list of reserves' do
    render

    assert_select 'p>strong', text: 'Book:'.to_s, count: 2
    assert_select 'p>strong', text: 'User:'.to_s, count: 2
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reserves/index', type: :view do
  let(:reserve_one) { create(:reserve) }
  let(:reserve_two) { create(:reserve) }

  before do
    relation = Reserve.order(:devolution_date).page()
    assign(:reserves, relation)
  end

  it 'renders a list of reserves' do
    render

    assert_select 'p>strong', text: 'Book title:'.to_s, count: 2
    assert_select 'p>strong', text: 'Devolution:'.to_s, count: 2
  end
end

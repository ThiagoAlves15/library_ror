# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  let(:user_one) { create(:user) }
  let(:user_two) { create(:user) }

  before do
    relation = User.order(created_at: :desc).page()
    assign(:users, relation)
  end

  xit 'renders a list of users' do
    render

    assert_select 'p>strong', text: 'Name:'.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:user_one) { create(:user) }
  let(:user_two) { create(:user) }

  before(:each) do
    assign(:users, [user_one, user_two])
  end

  it "renders a list of users" do
    render

    assert_select "p>strong", text: "Name:".to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe "reserves/index", type: :view do
  before(:each) do
    assign(:reserves, [
      Reserve.create!(
        book: nil,
        user: nil,
        status: 2
      ),
      Reserve.create!(
        book: nil,
        user: nil,
        status: 2
      )
    ])
  end

  it "renders a list of reserves" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end

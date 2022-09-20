require 'rails_helper'

RSpec.describe "reserves/show", type: :view do
  before(:each) do
    @reserve = assign(:reserve, Reserve.create!(
      book: nil,
      user: nil,
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end

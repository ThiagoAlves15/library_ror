require 'rails_helper'

RSpec.describe "reserves/show", type: :view do
  let(:reserve) { create(:reserve) }

  before(:each) do
    @reserve = assign(:reserve, reserve)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end

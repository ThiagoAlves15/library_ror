require 'rails_helper'

RSpec.describe "reserves/edit", type: :view do
  before(:each) do
    @reserve = assign(:reserve, Reserve.create!(
      book: nil,
      user: nil,
      status: 1
    ))
  end

  it "renders the edit reserve form" do
    render

    assert_select "form[action=?][method=?]", reserve_path(@reserve), "post" do

      assert_select "input[name=?]", "reserve[book_id]"

      assert_select "input[name=?]", "reserve[user_id]"

      assert_select "input[name=?]", "reserve[status]"
    end
  end
end

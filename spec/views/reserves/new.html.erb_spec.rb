require 'rails_helper'

RSpec.describe "reserves/new", type: :view do
  before(:each) do
    assign(:reserve, Reserve.new(
      book: nil,
      user: nil,
      status: 1
    ))
  end

  it "renders new reserve form" do
    render

    assert_select "form[action=?][method=?]", reserves_path, "post" do

      assert_select "input[name=?]", "reserve[book_id]"

      assert_select "input[name=?]", "reserve[user_id]"

      assert_select "input[name=?]", "reserve[status]"
    end
  end
end

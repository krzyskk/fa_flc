require 'rails_helper'

RSpec.describe "chores/new", type: :view do
  before(:each) do
    assign(:chore, Chore.new(
      :name => "MyString",
      :string => "MyString",
      :day => nil,
      :type => ""
    ))
  end

  it "renders new chore form" do
    render

    assert_select "form[action=?][method=?]", chores_path, "post" do

      assert_select "input[name=?]", "chore[name]"

      assert_select "input[name=?]", "chore[string]"

      assert_select "input[name=?]", "chore[day_id]"

      assert_select "input[name=?]", "chore[type]"
    end
  end
end

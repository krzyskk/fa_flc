require 'rails_helper'

RSpec.describe "chores/edit", type: :view do
  before(:each) do
    @chore = assign(:chore, Chore.create!(
      :name => "MyString",
      :string => "MyString",
      :day => nil,
      :type => ""
    ))
  end

  it "renders the edit chore form" do
    render

    assert_select "form[action=?][method=?]", chore_path(@chore), "post" do

      assert_select "input[name=?]", "chore[name]"

      assert_select "input[name=?]", "chore[string]"

      assert_select "input[name=?]", "chore[day_id]"

      assert_select "input[name=?]", "chore[type]"
    end
  end
end

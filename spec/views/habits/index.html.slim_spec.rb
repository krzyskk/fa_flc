require 'rails_helper'

RSpec.describe "habits/index", type: :view do
  before(:each) do
    assign(:habits, [
      Habit.create!(
        :name => "Name"
      ),
      Habit.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of habits" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

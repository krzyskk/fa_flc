require 'rails_helper'

RSpec.describe "chores/index", type: :view do
  before(:each) do
    assign(:chores, [
      Chore.create!(
        :name => "Name",
        :string => "String",
        :day => nil,
        :type => "Type"
      ),
      Chore.create!(
        :name => "Name",
        :string => "String",
        :day => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of chores" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        :front => "MyText",
        :back => "MyText",
        :showed => 2,
        :coorect => 3
      ),
      Card.create!(
        :front => "MyText",
        :back => "MyText",
        :showed => 2,
        :coorect => 3
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

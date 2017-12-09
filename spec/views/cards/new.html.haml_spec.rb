require 'rails_helper'

RSpec.describe "cards/new", type: :view do
  before(:each) do
    assign(:card, Card.new(
      :front => "MyText",
      :back => "MyText",
      :showed => 1,
      :coorect => 1
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "textarea[name=?]", "card[front]"

      assert_select "textarea[name=?]", "card[back]"

      assert_select "input[name=?]", "card[showed]"

      assert_select "input[name=?]", "card[coorect]"
    end
  end
end

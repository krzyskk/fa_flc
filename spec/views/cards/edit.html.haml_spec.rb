require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :front => "MyText",
      :back => "MyText",
      :showed => 1,
      :coorect => 1
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "textarea[name=?]", "card[front]"

      assert_select "textarea[name=?]", "card[back]"

      assert_select "input[name=?]", "card[showed]"

      assert_select "input[name=?]", "card[coorect]"
    end
  end
end

require 'rails_helper'

RSpec.describe "decks/index", type: :view do
  before(:each) do
    assign(:decks, [
      Deck.create!(
        :name => "Name"
      ),
      Deck.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of decks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

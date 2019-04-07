require 'rails_helper'

RSpec.describe "short_questions/index", type: :view do
  before(:each) do
    assign(:short_questions, [
      ShortQuestion.create!(
        :question => "Question",
        :answer => "Answer",
        :note => nil
      ),
      ShortQuestion.create!(
        :question => "Question",
        :answer => "Answer",
        :note => nil
      )
    ])
  end

  it "renders a list of short_questions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

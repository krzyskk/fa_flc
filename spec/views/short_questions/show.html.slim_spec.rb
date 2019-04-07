require 'rails_helper'

RSpec.describe "short_questions/show", type: :view do
  before(:each) do
    @short_question = assign(:short_question, ShortQuestion.create!(
      :question => "Question",
      :answer => "Answer",
      :note => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(//)
  end
end

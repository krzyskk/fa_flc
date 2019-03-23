require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :title => "Title",
      :content => "MyText",
      :short_answer => "Short Answer",
      :question => "Question"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Short Answer/)
    expect(rendered).to match(/Question/)
  end
end

require 'rails_helper'

RSpec.describe "short_questions/edit", type: :view do
  before(:each) do
    @short_question = assign(:short_question, ShortQuestion.create!(
      :question => "MyString",
      :answer => "MyString",
      :note => nil
    ))
  end

  it "renders the edit short_question form" do
    render

    assert_select "form[action=?][method=?]", short_question_path(@short_question), "post" do

      assert_select "input[name=?]", "short_question[question]"

      assert_select "input[name=?]", "short_question[answer]"

      assert_select "input[name=?]", "short_question[note_id]"
    end
  end
end

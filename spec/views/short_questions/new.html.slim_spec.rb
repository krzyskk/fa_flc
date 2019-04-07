require 'rails_helper'

RSpec.describe "short_questions/new", type: :view do
  before(:each) do
    assign(:short_question, ShortQuestion.new(
      :question => "MyString",
      :answer => "MyString",
      :note => nil
    ))
  end

  it "renders new short_question form" do
    render

    assert_select "form[action=?][method=?]", short_questions_path, "post" do

      assert_select "input[name=?]", "short_question[question]"

      assert_select "input[name=?]", "short_question[answer]"

      assert_select "input[name=?]", "short_question[note_id]"
    end
  end
end

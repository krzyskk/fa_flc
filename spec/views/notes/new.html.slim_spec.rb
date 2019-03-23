require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :title => "MyString",
      :content => "MyText",
      :short_answer => "MyString",
      :question => "MyString"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input[name=?]", "note[title]"

      assert_select "textarea[name=?]", "note[content]"

      assert_select "input[name=?]", "note[short_answer]"

      assert_select "input[name=?]", "note[question]"
    end
  end
end

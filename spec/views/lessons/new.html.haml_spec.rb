require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :wrong_answers => 1,
      :correct_answers => 1
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input[name=?]", "lesson[wrong_answers]"

      assert_select "input[name=?]", "lesson[correct_answers]"
    end
  end
end

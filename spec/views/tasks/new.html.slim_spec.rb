require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyString",
      :color => "MyString",
      :priority => 1,
      :done => false,
      :day => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[name]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[color]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[done]"

      assert_select "input[name=?]", "task[day_id]"
    end
  end
end

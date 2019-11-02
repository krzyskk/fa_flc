require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :description => "MyString",
      :color => "MyString",
      :priority => 1,
      :done => false,
      :day => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[name]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[color]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[done]"

      assert_select "input[name=?]", "task[day_id]"
    end
  end
end

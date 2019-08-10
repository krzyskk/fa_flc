require 'rails_helper'

RSpec.describe "habits/show", type: :view do
  before(:each) do
    @habit = assign(:habit, Habit.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

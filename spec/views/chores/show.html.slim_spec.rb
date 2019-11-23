require 'rails_helper'

RSpec.describe "chores/show", type: :view do
  before(:each) do
    @chore = assign(:chore, Chore.create!(
      :name => "Name",
      :string => "String",
      :day => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end

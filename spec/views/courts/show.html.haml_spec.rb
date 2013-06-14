require 'spec_helper'

describe "courts/show" do
  before(:each) do
    @court = assign(:court, stub_model(Court,
      :category => "Category",
      :state => "State",
      :name => "Name",
      :blob => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    rendered.should match(/State/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end

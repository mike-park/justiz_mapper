require 'spec_helper'

describe "courts/index" do
  before(:each) do
    assign(:courts, [
      stub_model(Court,
        :category => "Category",
        :state => "State",
        :name => "Name",
        :blob => "MyText"
      ),
      stub_model(Court,
        :category => "Category",
        :state => "State",
        :name => "Name",
        :blob => "MyText"
      )
    ])
  end

  it "renders a list of courts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

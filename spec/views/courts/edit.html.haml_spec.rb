require 'spec_helper'

describe "courts/edit" do
  before(:each) do
    @court = assign(:court, stub_model(Court,
      :category => "MyString",
      :state => "MyString",
      :name => "MyString",
      :blob => "MyText"
    ))
  end

  it "renders the edit court form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", court_path(@court), "post" do
      assert_select "input#court_category[name=?]", "court[category]"
      assert_select "input#court_state[name=?]", "court[state]"
      assert_select "input#court_name[name=?]", "court[name]"
      assert_select "textarea#court_blob[name=?]", "court[blob]"
    end
  end
end

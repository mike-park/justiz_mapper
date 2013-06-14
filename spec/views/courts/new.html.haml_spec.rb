require 'spec_helper'

describe "courts/new" do
  before(:each) do
    assign(:court, stub_model(Court,
      :category => "MyString",
      :state => "MyString",
      :name => "MyString",
      :blob => "MyText"
    ).as_new_record)
  end

  it "renders new court form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", courts_path, "post" do
      assert_select "input#court_category[name=?]", "court[category]"
      assert_select "input#court_state[name=?]", "court[state]"
      assert_select "input#court_name[name=?]", "court[name]"
      assert_select "textarea#court_blob[name=?]", "court[blob]"
    end
  end
end

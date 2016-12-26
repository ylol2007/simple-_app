require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :right => "Right",
        :string => "String"
      ),
      User.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :right => "Right",
        :string => "String"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Right".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
  end
end

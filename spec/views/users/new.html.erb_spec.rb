require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :right => "MyString",
      :string => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_phone[name=?]", "user[phone]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_right[name=?]", "user[right]"

      assert_select "input#user_string[name=?]", "user[string]"
    end
  end
end

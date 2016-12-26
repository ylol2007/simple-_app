require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :right => "MyString",
      :string => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_phone[name=?]", "user[phone]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_right[name=?]", "user[right]"

      assert_select "input#user_string[name=?]", "user[string]"
    end
  end
end

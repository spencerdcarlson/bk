require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link 'password'
    fill_in 'Email', :with => user.email
    click_button 'Reset'
    current_path.should eq(login_path)
    page.should have_content('Email has been')
    last_email.to.should include(user.email)
    #save_and_open_page
  end
end
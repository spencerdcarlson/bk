require 'spec_helper'

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

RSpec::Matchers.define :allow_attr do |*args|
  match do |permission|
    permission.allow_attr?(*args).should be_true
  end
end

describe Permission, focus: true do
  describe "as guest" do
    subject { Permission.new(nil) }
    it { should allow("sessions","new") }
    it { should allow("users", "new") }
    it { should allow('users', 'create') }
    it { should allow('password_resets', 'new') }
    it { should allow('password_resets', 'create') }
    it { should allow('password_resets', 'edit') }
    it { should allow('password_resets', 'update') }
    it { should_not allow('users', 'show') }
    it { should_not allow('users', 'edit') }
    it { should_not allow('activities', "index") }
  end
  
  describe "as normal user" do
    let(:user){ FactoryGirl.create(:user, is_admin: false ) }
    let(:activity){ FactoryGirl.create(:activity) }
    let(:interest){ FactoryGirl.build(:interest, user_id: user.id, activity_id: activity.id ) }
    let(:other_interest){ FactoryGirl.build(:interest, activity_id: activity.id ) }
    subject { Permission.new(user)}
    it { should allow("sessions","new") }
    it { should allow("users", "new") }
    it { should allow('users', 'create') }
    it { should allow('password_resets', 'new') }
    it { should allow('password_resets', 'create') }
    it { should allow('password_resets', 'edit') }
    it { should allow('password_resets', 'update') }
    it { should allow('interests','edit', interest )}
    it { should_not allow('interests','edit', other_interest )}
    it { should allow('users', 'show') }
    it { should allow('users', 'edit') }
    it { should_not allow_attr("users","is_admin")}
    it { should_not allow('activities', "index") }
  end
    
      
  describe "as admin" do
    subject { Permission.new(FactoryGirl.build(:user, is_admin: true ))}
    it { should allow("sessions","new") }
    it { should allow("users", "new") }
    it { should allow('users', 'create') }
    it { should allow('password_resets', 'new') }
    it { should allow('password_resets', 'create') }
    it { should allow('password_resets', 'edit') }
    it { should allow('password_resets', 'update') }
    it { should allow('users', 'show') }
    it { should allow('users', 'edit') }
    it { should allow('activities', "index") }
  end
  
end
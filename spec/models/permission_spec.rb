require 'spec_helper'

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
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
        subject { Permission.new(FactoryGirl.build(:user))}
        it { should allow("sessions","new") }
        it { should allow("users", "new") }
        it { should allow('users', 'create') }
        it { should allow('password_resets', 'new') }
        it { should allow('password_resets', 'create') }
        it { should allow('password_resets', 'edit') }
        it { should allow('password_resets', 'update') }
        it { should allow('users', 'show') }
        it { should allow('users', 'edit') }
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
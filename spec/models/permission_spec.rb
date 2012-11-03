require 'spec_helper'

RSpec::Matchers.define :allow do |controller, actions, resource|
  match do |permission|
    Array(actions).each do |action|
      permission.allow?(controller,action,resource).should be_true
    end
  end
end
RSpec::Matchers.define :allow_attr do |model,atributes|
  match do |permission|
    Array(atributes).each do |atribute|
      permission.allow_attr?(model,atribute).should be_true
    end
  end
end

describe Permissions, focus: true do
  describe "as guest" do
    subject { Permissions.permission_for(nil) }
    it "has correct privliges for a guest" do
      # Controller Actions
      should allow(:sessions,         [:new,:create,:destroy] )
      should allow(:password_resets,  [:new, :create, :edit, :update] )
      should allow(:users,            [:create,:new])
      should allow(:authentications,   [:create, :failure])
      should_not allow(:users,        [:index,:show,:edit,:update,:destroy] )
      should_not allow(:activities,   [:index,:new,:create,:show,:edit,:update,:destroy])
      should_not allow(:interests,    [:index,:new,:create,:show,:edit,:update,:destroy])
    end
  end
  
  describe "as normal user" do
    let(:user){ FactoryGirl.create(:user, is_admin: false ) }
    let(:activity){ FactoryGirl.create(:activity) }
    let(:interest){ FactoryGirl.build(:interest, user_id: user.id, activity_id: activity.id ) }
    let(:other_interest){ FactoryGirl.build(:interest, activity_id: activity.id ) }
    subject { Permissions.permission_for(user) }
    it "has correct privilges for a normal user" do
      # Controller Actions
      should allow(:sessions,         :new)
      should allow(:password_resets,  [:new,:create,:edit,:update] )
      #should allow(:users,            [:new,:create,:show])
      should allow(:users,            [:new,:create])
      should allow(:interests,        [:new,:create] )
      should allow(:authentications,  [:create, :failure])
      should_not allow(:activities,   [:index,:new,:create,:show,:edit,:update,:destroy])
      
      # Controller Actions Resource
      should allow(:users,            [:show,:edit,:update,:destroy], user)
      should_not allow(:users,        [:show,:edit,:update,:destroy], nil)
      should allow(:interests,        [:edit,:update,:destroy], interest )
      should_not allow(:interests,    [:edit,:update,:destroy], other_interest )
      # Model Attributes
      should_not allow_attr(:users,   :is_admin)
    end
  end
       
  describe "as admin" do
    subject { Permissions.permission_for(FactoryGirl.build(:user, is_admin: true ))}
    it "has correct privileges for an admin" do
      # Controller Actions
      should allow(:sessions,         [:index,:new,:create,:show,:edit,:update,:destroy])
      should allow(:users,            [:index,:new,:create,:show,:edit,:update,:destroy])
      should allow(:password_resets,  [:index,:new,:create,:show,:edit,:update,:destroy])
      should allow(:activities,       [:index,:new,:create,:show,:edit,:update,:destroy])
      should allow(:interests,        [:index,:new,:create,:show,:edit,:update,:destroy])
      should allow(:authentications,  [:index,:new,:create,:show,:edit,:update,:destroy])
    end
  end
  
end
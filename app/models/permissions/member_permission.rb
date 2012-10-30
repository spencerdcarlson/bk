module Permissions
  class MemberPermission < BasePermission
    def initialize(user)
      allow :sessions,        [:new,:create,:destroy]
      allow :password_resets, [:new,:create,:edit,:update]
      allow :users,           [:new,:create,:show,:edit,:update]
      # allow :users,           [:show,:edit,:update,:destroy] do |current_user|
      #                    current_user.auth_token == user.auth_token
      #                  end
      allow :interests,       [:new, :create]
      allow :interests,       [:edit, :update, :destroy] do |interest| 
        interest.user_id == user.id 
      end
      allow_attr :user,       [:email, :zip_code]
    end
  end
end
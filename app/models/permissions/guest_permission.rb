module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow :users,           [:new, :create]
      allow :sessions,        [:new, :create, :destroy]
      allow :password_resets, [:new, :create, :edit, :update]
      allow :authentications, [:create, :failure, :returning]
    end
  end
end

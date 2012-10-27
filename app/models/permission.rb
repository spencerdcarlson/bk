class Permission < Struct.new(:user)
  def allow?(controller, action)
    #controller == 'sessions' && action == 'new'
    #user && user.is_admin?
    true    
  end
end
  
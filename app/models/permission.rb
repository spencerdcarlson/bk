class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == 'password_resets' 
    return true if controller == 'users' && action.in?(%w[new create])
    return true if controller == 'sessions' && action.in?(%w[new create destroy])
    if !user.nil?
      return true if controller == 'interests' && action.in?(%w[new create update destroy])
      return true if controller == 'users' && action.in?(%w[show edit update])
      return true if user.is_admin?
    end
    return false
  end    
end
  
class UserConstraint
  def self.matches?(request)
    !request.session[:user_id].nil?
  end
end

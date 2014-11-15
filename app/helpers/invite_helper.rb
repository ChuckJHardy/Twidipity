module InviteHelper
  def signin_link
    if session[:user_id]
      "10/01/2015"
    else
      link_to "Signin", "/auth/twitter"
    end
  end
end

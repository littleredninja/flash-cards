helpers do
  
  def em(text)
    "<em>#{text}</em>"
  end

  def session_user
		if session[:user_id]
    	@user = User.find_by(:id => session[:user_id])
    end
  end

end
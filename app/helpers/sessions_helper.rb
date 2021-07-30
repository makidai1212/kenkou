module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if ( user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent.signed[:user_id] = user.id
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_user)
    cookies.delete(:user_id)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user && user == current_user
  end
end

# 遷移しようとしていたURLを保存する
def store_location
  session[:forwarding_url] = request.original_url if request.get?
end

# store_locationで保存していたURLに実際に遷移させる
def redirect_back_or(default)
  redirect_to(session[:forwarding_url] || default)
  session.delete(:forwarding_url)
end
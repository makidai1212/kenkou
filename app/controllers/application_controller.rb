class ApplicationController < ActionController::Base
  include SessionsHelper

  # ログインしてないと操作できないようにするやつ
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Log in"
      redirect_to root_path
    end
  end
end

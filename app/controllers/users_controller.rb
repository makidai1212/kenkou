class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.limit(15).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.limit(15).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "#{@user.name} を闇に葬った"
    redirect_to users_path
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # 本人しか操作できないようにするやつ
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    # 管理ユーザーじゃなければHOME画面に飛ばすやつ
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
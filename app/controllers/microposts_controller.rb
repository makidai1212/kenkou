class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost craeted!"
      redirect_to root_path
    else
      @feed_items = current_user.feed.limit(15).page(params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "闇に葬った"
    redirect_to request.referrer || root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_path if @micropost.nil?
    end
end

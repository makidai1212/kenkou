class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.limit(15).page(params[:page])
  end

  def about
  end

  def contact
  end
end

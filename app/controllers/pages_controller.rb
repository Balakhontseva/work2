class PagesController < ApplicationController
    def home
    @title = "Home"
    if signed_in?
      @post = Post.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
  end

end

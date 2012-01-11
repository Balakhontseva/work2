class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    @user = User.authenticate(params[:session][:login],params[:session][:password])
    if @user.nil?
      flash.now[:error] = "Invalid login/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in @user
      redirect_to @user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end


    def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
	end
	
    def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

   private
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end

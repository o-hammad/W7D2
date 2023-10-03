class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(username: params[:user][:email], password: params[:user][:password])

    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      @user = User.new(username: params[:user][:email])
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end

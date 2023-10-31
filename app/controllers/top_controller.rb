require 'bcrypt'
class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      @tweets = Tweet.all
      redirect_to tweets_path
    else
      render "login"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end

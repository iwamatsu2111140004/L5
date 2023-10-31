require 'bcrypt'
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    pass = BCrypt::Password.create(params[:pass])
    user = User.new(uid: params[:uid], pass: pass, age: params[:age])
    user.save
    session[:login_uid] = params[:uid]
    redirect_to tweets_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end

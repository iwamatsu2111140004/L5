require 'bcrypt'
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #pass = BCrypt::Password.create(params[:password])
    @user = User.new(uid: params[:uid], password: params[:user][:password], age: params[:age],password_confirmation: params[:password_confirmation])
    if @user.save
        redirect_to users_path
    else
        render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end

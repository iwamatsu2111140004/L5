class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
      @tweet = Tweet.new
    end
    def create
      @tweet = Tweet.new(message: params[:tweet][:message], user_id: session[:login_uid])
      @tweet.save
      redirect_to root_path
    end
    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to root_path
    end
    
end

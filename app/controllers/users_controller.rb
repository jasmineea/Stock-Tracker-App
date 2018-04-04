class UsersController < ApplicationController
    
    def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end
    
     def my_friends
    @friendships = current_user.friends
  end
    
   def search
    @users = User.search(params[:search_param])
    render json: @users
  end
      def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    if current_user.save
      flash[:notice] = "Friend was successfully added"
    else
      flash[:danger] = "There was something wrong with the friend request"
    end  
    redirect_to my_friends_path
  end
    def show
  @user = User.find(params[:id])
  @user_stocks = @user.stocks
end
end
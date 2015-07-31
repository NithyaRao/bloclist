class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @items = @user.items
     @item = Item.new
     authorize @user
  end
end

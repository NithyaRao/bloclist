class ItemsController < ApplicationController
  
 def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.build(item_params)
    @item.user = @user
    if @item.save
       flash[:notice] = "Item was saved to the To-Do list"
       redirect_to @user
     else
       flash[:error] = "There was an error saving the item. Please try again."
       render "items/new" 
     end       
   end

  def destroy
     @item = Item.find(params[:id])
    # authorize @item
     if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
       redirect_to @user
     else
       flash[:error] = "There was an error deleting the Item. Please try again."
       render user_path[@user]
     end
  end


  private

  def item_params
     params.require(:item).permit(:name)
  end

end

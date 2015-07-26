class ItemsController < ApplicationController
  
 def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new
    if @item.save
       flash[:notice] = "Item was saved to the To-Do list"
    else
       flash[:error] = "There was an error saving the item. Please try again."
    end 
     respond_to do |format|
      format.html { redirect_to [@item.user] }
      format.js
    end      
 end

 def destroy
      @item = Item.find(params[:id])
     # authorize @item
     if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."      
     else
       flash[:error] = "There was an error deleting the Item. Please try again."
     end

     respond_to do |format|
       format.html { redirect_to [@item.user] }
       format.js
      # format.json { head :no_content }
      # format.js { render :layout => false }
     end
 end


  private

  def item_params
     params.require(:item).permit(:name)
  end

end

class ItemsController < ApplicationController
    def index
        @items = Item.all.select{ |item| (item.user_id != session[:user_id] && item.available) }
    end

    def new
      @item = Item.new
    end

    def create
      user = User.find(session[:user_id])
      @item = Item.create(answer_params)
      @item.user = user
      @item.save
      if @item.save
        redirect_to my_items_path
      else
        flash.now[:error] = "Please give a name to your item"
        render 'new'
      end
    end

    def show
      @item = Item.find(params[:id])
    end

    def destroy
      @item = Item.find(params[:id])

    end
    private

   def answer_params
       params.require(:item).permit(:name, :image)
   end

end

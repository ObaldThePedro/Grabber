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
      elsif @item.name == ""
        flash.now[:error] = "Please give a name to your item"
        render 'new'
      else !@item.image
        flash.now[:error] = "Please enter an image"  
        render 'new'
      end
    end

    def show
      @item = Item.find params[:id]
    end

    def edit
      @item = Item.find params[:id]
    end

    def update
      @item = Item.find params[:id]
      if @item.update(:image, :description)
        redirect_to my_items_path
      else
        flash.now[:error] = "Please give a name to your item"
        render 'edit'
      end
    end

    def destroy
      @item = Item.find params[:id]
      @item.destroy
      redirect_to my_items_path
    end

    private

   def answer_params
       params.require(:item).permit(:name, :description, :image)
   end

end

class LikesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @likes = @user.likes.page(params[:page]).per(8)
  end
  def create
    @item = Item.find(params[:item_id])
    @like = Like.create(user_id: current_user.id, item_id: @item.id)
    redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    Like.find_by(user_id: current_user.id, item_id: @item.id).destroy
    redirect_back(fallback_location: root_path)
  end
end

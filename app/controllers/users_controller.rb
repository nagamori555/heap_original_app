class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    unless user_signed_in?
      render action: :start
    else
      @users = User.where.not(id: current_user.id).page(params[:page]).per(8)
    end

  end
  def show
    @user = User.find(params[:id])
    @items = @user.items
    @status = @user.status

    @next_level = next_level
    
    @category1 = Item.where(user_id: @user.id, media_id: 2)
    @category2 = Item.where(user_id: @user.id, media_id: 3)
    @category3 = Item.where(user_id: @user.id, media_id: 4)
    @category4 = Item.where(user_id: @user.id, media_id: 5)
    @category5 = Item.where(user_id: @user.id, media_id: 6)

    @genre1 = Item.where(user_id: @user.id, genre_id: 2)
    @genre2 = Item.where(user_id: @user.id, genre_id: 3)
    @genre3 = Item.where(user_id: @user.id, genre_id: 4)
    @genre4 = Item.where(user_id: @user.id, genre_id: 5)
    @genre5 = Item.where(user_id: @user.id, genre_id: 6)
    @genre6 = Item.where(user_id: @user.id, genre_id: 7)
    @genre7 = Item.where(user_id: @user.id, genre_id: 8)
    @genre8 = Item.where(user_id: @user.id, genre_id: 9)
    @genre9 = Item.where(user_id: @user.id, genre_id: 10)
    @genre10 = Item.where(user_id: @user.id, genre_id: 11)
    @genre11 = Item.where(user_id: @user.id, genre_id: 12)
    @genre12 = Item.where(user_id: @user.id, genre_id: 13)
    @genre13 = Item.where(user_id: @user.id, genre_id: 14)
    @genre14 = Item.where(user_id: @user.id, genre_id: 15)
    @genre15 = Item.where(user_id: @user.id, genre_id: 16)
    @genre16 = Item.where(user_id: @user.id, genre_id: 17)
  end
  
  private
  def next_level
    leveltable = Leveltable.find_by(level: @status.level + 1)
    return leveltable.threshold - @status.exp
  end
end

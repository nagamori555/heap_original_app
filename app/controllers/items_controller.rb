class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_user, only: [:index, :search]
  before_action :search_item, only: [:index, :search]
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @status = @item.user.status
    change_status
    accumulate_exp
    check_level
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = @user.items.page(params[:page]).per(8)
    @medium = Media.all
    @genres = Genre.all
    @preferences = Preference.all
    @category1 = Item.where(user_id: @user.id, media_id: 2)
    @category2 = Item.where(user_id: @user.id, media_id: 3)
    @category3 = Item.where(user_id: @user.id, media_id: 4)
    @category4 = Item.where(user_id: @user.id, media_id: 5)
    @category5 = Item.where(user_id: @user.id, media_id: 6)
    set_item_column

    
  end
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
     redirect_to item_path(params[:id]) 
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.page(params[:page]).per(8)
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :media_id, :genre_id, :preference_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  def search_item
    @p = @user.items.ransack(params[:q]) 
  end

  def set_item_column
    @item_name = @user.items.select("title").distinct 
  end
  


  def change_status
    if @item.genre.id == 4 || @item.genre.id == 7 ||@item.genre.id == 17
      @status.inteligence += 2
    elsif @item.genre.id == 3 || @item.genre.id == 11 ||@item.genre.id == 12
      @status.humor += 2
    elsif @item.genre.id == 5 || @item.genre.id == 10 ||@item.genre.id == 15
      @status.courage += 2
    elsif @item.genre.id == 2 || @item.genre.id == 9
      @status.consideration += 2
    elsif @item.genre.id == 8 || @item.genre.id == 14
      @status.luck += 2
    elsif @item.genre.id == 6 || @item.genre.id == 13 ||@item.genre.id == 16
      @status.decisiveness += 2
    end
    @status.save
  end

  def accumulate_exp
    if @item.media.id == 6
      exp = 5
    elsif @item.media.id == 5
      exp = 4
    elsif @item.media.id == 2 || @item.media.id == 3 || @item.media.id == 4
      exp = 3
    end
    if @item.preference.id == 2
     exp = exp * 1.5 
    elsif @item.preference.id == 3
     exp = exp * 1.3
    elsif @item.preference.id == 4
     exp = exp * 1
    elsif @item.preference.id == 5
     exp = exp * 0.8
    end
    @status.exp += exp.round
    @status.save
  end

  def check_level
    levelTable = Leveltable.find_by(level: @status.level + 1)
    until @status.exp < levelTable.threshold
      @status.level = @status.level + 1
      @status.save(level: @status.level)
      levelTable = Leveltable.find_by(level: @status.level + 1)
    end
  end
end

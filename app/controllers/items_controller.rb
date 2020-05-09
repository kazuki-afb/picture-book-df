class ItemsController < ApplicationController
  # before_action :move_to_index except: [:index, :show, :search]
  def index
    @items = Item.order('name').page(params[:page]).per(1)
    # @item = Item.find(params[:id])
    # @comments = @item.comments.includes(:item)
    # @images = @item.images.includes(:item)
  end

  def new
    # itemのインスタンス生成
    @item = Item.new
  end

  def create
    # new.html.hamlで入力した情報を保存、保存したitemビューへ、保存できなかったら戻る
    @item = Item.new(item_params)
    if @item.save
      session[:id] = @item.id
      redirect_to item_path(session[:id])
    else
      render :new
    end
  end

  def show
    # 表示しているitemのidと同じ
    # item_idカラムのcommentを表示
    @item = Item.find(params[:id])
    @comment = Comment.new
    @image = Image.new
    @comments = @item.comments.includes(:item)
    @images = @item.images.includes(:item)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:name, :ability_type_id, :ability_person, :race, item_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

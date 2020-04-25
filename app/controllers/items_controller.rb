class ItemsController < ApplicationController
  
  def index
    # @items = Item.find(params[:id])
    # @comments = Comment.all
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
    @comments = @item.comments.includes(:item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :ability_type_id, :ability_person)
  end

end

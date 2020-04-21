class CommentsController < ApplicationController
  before_action :set_item # アクション前にset_itemを呼び出す

  def new
    # インスタンス生成
    @comment = Comment.new
    
  end

  def create
    # new.html.hamlで入力した情報を保存、保存したitemビューへ、保存できなかったら戻る
    @comment = Comment.new(comment_params)
    if @comment.save
      session[:item_id] = @comment.item_id
      redirect_to item_path(session[:item_id])
    else
      render :new
    end
  end


  private

  def comment_params
    params.require(:comment).permit(
      :image, :ability, :consumer, :skill
    ).merge( # 外部キーをマージさせる
      user_id: current_user.id, item_id: params[:item_id]
    ) 
  end

  def set_item
    # ネストしてあるのでitem_idを呼び出す必要がある
    @item = Item.find(params[:item_id])
  end
end

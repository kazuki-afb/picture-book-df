class CommentsController < ApplicationController
  def new
    # routes.rbでitemsにネストしているので
    # どのitemに紐づいているのかを記述する
    @item = Item.find(params[:item_id])
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
end

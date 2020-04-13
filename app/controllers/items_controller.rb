class ItemsController < ApplicationController
  def index
  end

  def new
    # itemのインスタンス生成
    @item = Item.new
  end

  def create
    # new.html.hamlで入力した情報を保存、保存したitemビューへ、保存できなかったら戻る
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :ability_type_id, :ability_person)
  end

end

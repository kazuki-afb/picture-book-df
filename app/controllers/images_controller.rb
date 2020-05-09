class ImagesController < ApplicationController
  before_action :set_item # アクション前にset_itemを呼び出す
  def index
    # @item = Item.where(params[:id])
    @images = @item.images.includes(:item)
  end
  def new
    @image = Image.new
  end
  def create
    @image = Image.new(image_params)
    if @image.save
      session[:item_id] = @image.item_id
      redirect_to item_path(session[:item_id])
    else
      render :new
    end
    # @image = Image.create(image_params)
    # respond_to do |format|
    #   format.html {redirect_to item_path(params[:item_id])}
    #   format.json
    # end
  end

  private

  def image_params
    params.require(:image).permit(
      :image
    ).merge(
      item_id: params[:item_id]
    )
  end

  def set_item
    # ネストしてあるのでitem_idを呼び出す必要がある
    @item = Item.find(params[:item_id])
  end
end

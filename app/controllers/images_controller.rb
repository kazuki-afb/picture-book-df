class ImagesController < ApplicationController

  def new
    @item = Item.find(params[:id])
    @image = Image.new
  end
  def create
    @image = Image.new(image_params)
    if @iamge.save
      session[:item_id] = @image.item_id
      redirect_to item_path(session[:item_id])
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(
      :image
    ).marge(
      item_id: params[:id]
    )
  end
end

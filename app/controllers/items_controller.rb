class ItemsController < ApplicationController

  praivate

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end

class PlayerController < ApplicationController
  def startadventure
    @adventure = Adventure.find(params[:adventure_id])
    @scene = Scene.where(adventure_id: @adventure.id).limit(1)[0]
  end

  def sceneplayer
    @adventure = Adventure.find(params[:adventure_id])
    @scene = Scene.find(params[:scene_id])
  end
end

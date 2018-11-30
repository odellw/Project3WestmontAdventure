class PlayerController < ApplicationController
  def startadventure
    @adventure = Adventure.find(params[:adventure_id])
    @scenes = Scene.where(adventure_id: @adventure.id)
  end
end

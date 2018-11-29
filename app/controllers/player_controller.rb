class PlayerController < ApplicationController
  def startadventure
    @adventure = Adventure.find(params[:adventure_id])
  end
end

class DecisionsController < ApplicationController
  def create
    @scene = Scene.find(params[:post_id])
    @decision = @scene.decisions.create(decision_params)
    redirect_to scene_path(@scene)
  end

  private def decision_params
    params.require(:decision).permit(:decisionDescription, :scene, :sceneToGoTo)
  end
end

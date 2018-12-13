class DecisionsController < ApplicationController

  def new
    @scene = Scene.find(params[:scene_id])
    @adventure = Adventure.find(params[:adventure_id])
    @scenes = Scene.where(adventure_id: @adventure.id)
    print "SCENE NAMES:"
    print @scenes
    @decision = Decision.new
  end

  def create
    @decision = Decision.new(decision_params)
    @scene = Scene.find(params[:scene_id])
    @decision = Decision.new(decisionDescription: @decision.decisionDescription, scene: @scene, sceneToGoTO: @decision.sceneToGoTO)

    print "this is the chosen decision scene:"
    print @decision.scene
    print "this is the chosen scene description:"
    print @decision.decisionDescription
    print "this is the chosen scene to go to"
    print @decision.sceneToGoTO
    if(@decision.save)
      redirect_to adventure_scenes_path + "/" + @scene.id.to_s
    else
      render 'new'
    end
  end

  def destroy
    print "--- delete decision ---"
    @scene = Scene.find(params[:scene_id])
    @decision = Decision.find(params[:id])
    @decision.destroy
    redirect_to adventure_scenes_path + "/" + @scene.id.to_s
  end

  def edit
      @decision = Decision.find(params[:id])
      @scene = Scene.find(params[:scene_id])
      @adventure = Adventure.find(params[:adventure_id])
  end

  def show
    @decision = Decision.find(params[:id])
  end

  def update
    @scene = Scene.find(params[:scene_id])
    @Decision = Decision.find(params[:decision_id])
    if(@Decision.update(decision_params))
      redirect_to adventure_scenes_path + "/" + @scene.id.to_s
    else
      render 'new'
    end
  end

  private def decision_params
    params.require(:decision).permit(:decisionDescription, :scene, :sceneToGoTO)
  end
end

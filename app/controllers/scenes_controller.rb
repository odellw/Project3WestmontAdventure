class ScenesController < ApplicationController
  def index
    @adventure = Adventure.find(params[:adventure_id])
    @scenes = Scene.where(adventure: {adventure_id: @adventure.id})

    sql = "Select * from scenes where adventure_id = " + @adventure.id.to_s
    print sql
    @scenes = Scene.find_by_sql(sql)
    print "These are the Scenes"
    print @scenes
  end

  def new
    @scene = Scene.new
    @adventure = Adventure.find(params[:adventure_id])
  end


  def create
      @scene = Scene.new(scene_params)
      @adventure = Adventure.find(params[:adventure_id])

      @scene = Scene.new(adventure: @adventure, description: @scene.description, sceneName: @scene.sceneName)

      print "this is the chosen scene adventure:"
      print @scene.adventure
      print "this is the chosen scene description:"
      print @scene.description
      print "this is the chosen scene name:"
      print @scene.sceneName
      if(@scene.save)
        redirect_to adventure_scenes_path
      else
        render 'new'
      end
    end

  def show
    @scene = Scene.find(params[:id])
  end

  def update
    @Scene = Scene.find(params[:id])
    if(@Scene.update(scene_params))
      redirect_to adventure_scenes_path
    else
      render 'new'
    end
  end

  def edit
      @scene = Scene.find(params[:id])
      @adventure = Adventure.find(params[:adventure_id])
    end

  def destroy
    print "--- delete scene ---"
    @scene = Scene.find(params[:id])
    @scene.destroy
    redirect_to home_path
  end


  private def scene_params
    params.require(:scene).permit(:adventure, :sceneName, :description)
  end

end

class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def new
    @scene = Scene.new
  end


  def create
      @scene = Scene.new(scene_params)
      print "this is the chosen scene:"
      print @scene
      if(@scene.save)
        redirect_to @scene
      else
        render 'new'
      end
    end

  def show
    @scene = Scene.find(params[:id])
  end


  private def scene_params
    params.require(:scene).permit(:adventure, :sceneName, :description)
  end

end

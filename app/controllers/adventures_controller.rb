class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def new
    @adventure = Adventure.new
  end

  def create
      @adventure = Adventure.new(adventure_params)
      print "this is the chosen adventure:"
      print @adventure
      if(@adventure.save)
        redirect_to @adventure
      else
        render 'new'
      end
    end

  def show
    @adventure = Adventure.find(params[:id])
  end


  def edit
      @adventure = Adventure.find(params[:id])
    end

  def update
    @adventure = Adventure.find(params[:id])
    if(@adventure.update(adventure_params))
      redirect_to @adventure
    else
      render 'new'
    end
  end

  def destroy
    print "--- delete adventure ---"
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to home_path
  end

  private def adventure_params
    params.require(:adventure).permit(:name, :description, :creator)
  end

end

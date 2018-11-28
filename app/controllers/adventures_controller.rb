class AdventuresController < ApplicationController
  def index
    @adventure = Adventure.all
  end

end

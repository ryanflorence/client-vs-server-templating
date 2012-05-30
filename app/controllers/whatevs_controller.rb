class WhatevsController < ApplicationController

  def api
    @whatevs = Whatev.all
    respond_to do |format|
      format.html { render :layout => false }
      format.json { render :json => @whatevs.as_json(:only => ['foo', 'bar']) }
    end
  end

  def index
  end

end

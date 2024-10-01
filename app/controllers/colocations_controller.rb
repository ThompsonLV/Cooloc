class ColocationsController < ApplicationController

  def home
    @colocation = Colocation.first

  end
  def index
      @colocations = Colocation.all
  end

  def show
    @colocation = Colocation.find(params[:id])
  end

  private

  def colocation_params
    params.require(:colocation).permit(:name)
  end

end

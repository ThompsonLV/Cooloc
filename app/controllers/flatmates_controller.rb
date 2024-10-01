class FlatmatesController < ApplicationController

  def index
      @flatmates = Flatmate.all
  end

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  def new
    @flatmate = Flatmate.new
    @flatmates = Flatmate.all
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    if @flatmate.save
      redirect_to flatmates_path
    else
      render :new
    end
  end

  private
  def flatmate_params
    params.require(:flatmate).permit(:first_name, :last_name, :birthday, :description, :colocation_id)
  end

end

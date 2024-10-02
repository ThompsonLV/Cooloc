class FlatmatesController < ApplicationController

  def index
    current_colocation_id = current_flatmate.colocation_id
    @flatmates = Flatmate.where(colocation_id: current_colocation_id)
  end

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    if @flatmate.save
      redirect_to flatmates_path
    else
      render :new
    end
  end

  def edit
    @flatmate = Flatmate.find(params[:id])
  end

  def update
    @flatmate = Flatmate.find(params[:id])
    if @flatmate.update(flatmate_params)
      redirect_to flatmates_path
    else
      render :edit
    end
  end

  def destroy
    @flatmate = Flatmate.find(params[:id])
    @flatmate.destroy
    redirect_to flatmates_path
  end

  private
  def flatmate_params
    params.require(:flatmate).permit(:first_name, :last_name, :birthday, :description, :colocation_id)
  end

end

class ChoresController < ApplicationController
  def index
    current_colocation_id = current_flatmate.colocation_id
    @chores = Chore.where(colocation_id: current_colocation_id)
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
    @flatmates = Flatmate.all
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      redirect_to chores_path
    else
      render :new
    end
  end

  def edit
    @chore = Chore.find(params[:id])
    @flatmates = Flatmate.all
  end

  def update
    @chore = Chore.find(params[:id])
    @chore.update(chore_params)
    redirect_to chore_path(@chore)
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to chores_path
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :content, :frequency, :begin_date, :flatmate_id, :colocation_id)
  end
end

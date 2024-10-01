class ChoresController < ApplicationController
  def index
    @chores = Chore.all
    @flatmates = Flatmate.all
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

  private
  def chore_params
    params.require(:chore).permit(:title, :content, :frequency, :begin_date, :flatmate_id, :colocation_id)
  end
end

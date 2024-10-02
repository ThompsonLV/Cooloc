class SpendingsController < ApplicationController
  def index
    @spendings = Spending.all
  end

  def show
    @spending = Spending.find(params[:id])
  end

  def new
    @spending = Spending.new
    @flatmates = Flatmate.all
  end

  def create
    @spending = Spending.new(spending_params)

    if @spending.save
      flatmate_ids = params[:flatmate_ids]
      flatmate_ids.each do |flatmate_id|
        SpendingToFlatmate.create(spending: @spending, flatmate_id: flatmate_id)
      end
      redirect_to spendings_path
    else
      render :new
    end
  end

  def edit
    @spending = Spending.find(params[:id])
    @flatmates = Flatmate.all
  end

  def update
    @spending = Spending.find(params[:id])
    @spending.update(spending_params)
    redirect_to spending_path(@spending)
  end

  def update
    @spending = Spending.find(params[:id])

    if @spending.update(spending_params)
      if params[:flatmate_ids]
        @spending.flatmates.clear
        params[:flatmate_ids].each do |flatmate_id|
          @spending.flatmates << Flatmate.find(flatmate_id)
        end
      end
      redirect_to spending_path(@spending), notice: 'Dépense mise à jour avec succès.'
    else
      @flatmates = Flatmate.all
      render :edit
    end
  end

  private
  def spending_params
    params.require(:spending).permit(:title, :amount)
  end
end

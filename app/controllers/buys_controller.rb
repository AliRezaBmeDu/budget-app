class BuysController < ApplicationController
    before_action :set_buy, only: [:show, :edit, :update, :destroy]

  def index
    @buys = Buy.all
  end

  def show
  end

  def new
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)

    if @buy.save
      redirect_to @buy, notice: 'Buy was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @buy.update(buy_params)
      redirect_to @buy, notice: 'Buy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @buy.destroy
    redirect_to buys_url, notice: 'Buy was successfully destroyed.'
  end

  private

  def set_buy
    @buy = Buy.find(params[:id])
  end

  def buy_params
    params.require(:buy).permit(:user_id, :category_id, :other_attributes)
  end
end

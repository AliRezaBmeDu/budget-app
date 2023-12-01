class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.includes(:buys).where(user_id: current_user.id)
    @categories.each do |category|
      category.total = category.buys.sum(:amount)
    end
  end

  def show
    session[:current_category_id] = @category.id
    @buys = @category.buys
    total = 0
    @buys.each do |buy|
      total += buy.amount
    end
    @category.total = total
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to homepage_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[welcome]

  def welcome; end

  def index
    @category = Category.where(author_id: current_user.id).order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @exchanges = @category.exchanges.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category)
    @category.author_id = current_user.id
    @exist = Category.where(name: params[:category][:name], author_id: current_user.id).first
    @category.save if @exist.nil?
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'Object was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to categories_path
  end

  private

  def category
    params.require(:category).permit(:name, :icon)
  end
end

class ExchangesController < ApplicationController
  def new
    @cate = Category.find(params[:cat_id])
    @transaction = Exchange.new
  end

  def create
    @original = Category.find(params[:cat_id])
    @cate = Category.where(name: params[:exchange][:category], author_id: current_user).first
    @transaction = Exchange.new(transaction)
    @transaction.author_id = current_user.id
    if @cate.nil?
      flash[:alert] = 'The catecory does not exist, create the category'
      # redirect_to category_path(@original.id)
      redirect_to categories_path
    else
      @transaction.save
      redirect_to category_path(@cate.id)
      @complete = CategoryExchange.new(exchange_id: @transaction.id, category_id: @cate.id)
      @complete.save
    end
  end

  private

  def transaction
    params.require(:exchange).permit(:name, :amount)
  end
end

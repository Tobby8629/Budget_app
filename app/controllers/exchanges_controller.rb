class ExchangesController < ApplicationController
  def new
    @all = Category.where(author_id: current_user.id)
    @cate = Category.find(params[:cat_id])
    @transaction = Exchange.new
  end

  def create
    @cate = Category.where(name: params[:exchange][:category], author_id: current_user).first
    @transaction = Exchange.new(transaction)
    @transaction.author_id = current_user.id
    @transaction.save
    redirect_to category_path(@cate.id)
    @complete = CategoryExchange.new(exchange_id: @transaction.id, category_id: @cate.id)
    @complete.save
  end

  private

  def transaction
    params.require(:exchange).permit(:name, :amount)
  end
end

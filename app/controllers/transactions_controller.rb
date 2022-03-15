class TransactionsController < ApplicationController
  def show
    @transaction = Entity.find(params[:id])
  end

  def new
    Entity.new
  end

  def create
    @new_entity = Entity.new(entity_params)

    if @new_entity.save
      redirect_to category_path(id: params[:category_id]), notice: 'Spending successfully added'
    else
      render :new, alert: 'Oops, Something went wrong'
    end
  end

  def destroy
    Entity.find(params[:id]).delete
    respond_to do |format|
      format.html { redirect_to category_path(id: params[:category_id], notice: 'Category successfully removed') }
    end
  end

  private

  def entity_params
    params.permit(:name, :amount, :user_id, :category_id)
  end
end

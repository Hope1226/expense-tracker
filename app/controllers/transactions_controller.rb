class TransactionsController < ApplicationController
  def index
    @transactions = Entity.all.where(user_id: current_user.id)
  end

  def show
    @transaction = Entity.find(params[:id])
  end

  def new
    Entity.new
  end

  def edit
    @transaction = Entity.find(params[:id])
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

  def update
    @transaction = Entity.find(params[:id])

    respond_to do |format|
      if @transaction.update(entity_params)
        format.html { redirect_to category_transaction_path({ id: @transaction.id, category_id: @transaction.group_id }), notice: 'Changes was successfully saved' }
      else
        format.html { render :edt, status: :unprocessable_entity }
      end
    end
  end

  private

  def entity_params
    params.permit(:name, :amount, :user_id, :group_id)
  end
end

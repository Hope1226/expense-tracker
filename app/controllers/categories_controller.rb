class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Group.all.where(user_id: current_user.id)
  end

  def show
    @category = Group.find(params[:id])
  end

  def new
    Group.new
  end

  def edit; end

  def create
    @new_category = Group.new(group_params)

    if @new_category.save
      redirect_to categories_path, notice: 'Category successfully created'
    else
      render :new, alert: 'Oops, Something went wrong'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category successfully removed' }
    end
  end

  def update
    @category = Group.find(params[:id])

    respond_to do |format|
      if @category.update(group_params)
        format.html { redirect_to categories_path, notice: 'Changes was successfully saved.' }
      else
        format.html { render :edt, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.permit(:name, :icon, :user_id)
  end
end

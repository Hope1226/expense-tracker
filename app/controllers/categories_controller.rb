class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Group.all.where(user_id: current_uder.id);
  end

  def show
    @category = Group.find(params[:id])
  end

  def new
    Group.new
  end

  def create
    @new_category = Group.new(group_params)

    if @new_category.save
      redirect_to :index, notice: 'Category successfully created'
    else
      render :new, alert: 'Oops, Something went wrong'
    end
  end

  def destroy
    Group.find(params[:id]).delete
    respond_to do |format|
      format.html { redirect_to :index, notice: 'Category successfully removed' }
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end

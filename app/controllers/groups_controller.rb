class GroupsController < ApplicationController
  before_action :set_user

  def index
    @groups = @user.groups.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to groups_path, notice: 'Category added successfully'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :new, status: 400
    end
  end

  def show
    @group = Group.find(params[:id])
    redirect_to groups_path, notice: 'You are not authorized to access this page!' unless @group.user == @user
    @expenses = @group.expenses.order(created_at: :desc)
    @total = @expenses.sum(:amount)
  end

  private

  def set_user
    @user = current_user
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

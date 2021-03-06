class GroupsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'create success'
    else
      render :new
    end
  end

  def show
    @posts = @group.posts
  end

  def edit
    render :new
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'update success'
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'delete success'
  end

  def join
    @group = Group.find(params[:id])
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
    else
      flash[:notice] = 'You already joined this group.'
    end
    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
    else
      flash[:notice] = 'You are not member of this group.'
    end
    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end

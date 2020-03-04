class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: %i[new create edit update destroy]
  before_action :find_post, only: %i[edit update destroy]

  def new
    @post = @group.posts.build
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to group_path(@group), notice: 'create success'
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @post.update(post_params)
      redirect_to group_path(@group), notice: 'update success'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to group_path(@group), notice: 'delete success'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_post
    @post = @group.posts.find(params[:id])
  end
end

class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :picture, :tag_list, :address))
    @post.user = current_user
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/posts'

    rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Can't delete - not your post"
    redirect_to '/posts'
  end

end

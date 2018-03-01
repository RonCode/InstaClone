class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Post couldn't be created. Check the form."
      render :new
    end
  end
  
  def show
    #set_post before action
  end
  
  def edit
    #set_post before action
  end
  
  def update
    #set_post before action
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed. Check the form."
      render :edit
    end
  end
  
  def destroy
    #set_post before action
    @post.destroy
    redirect_to root_path
  end
  
  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
end

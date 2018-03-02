class CommentsController < ApplicationController
  before_action :set_post

  def create
    #build the new @comment objec
    @comment = @post.comments.create(comment_params)
    #and then assign it the user_name field based on the user currently logged in
    @comment.user_id = current_user.id 
    if @comment.save
      flash[:success] = 'Comment posted!'
      redirect_to @post
    else
      flash.now[:danger] = "Error, comment not posted."
      render root_path
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end

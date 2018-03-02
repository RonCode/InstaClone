class CommentsController < ApplicationController
  before_action :set_post

  def create
    #build the new @comment objec
    @comment = @post.comments.create(comment_params)
    #and then assign it the user_name field based on the user currently logged in
    @comment.user_id = current_user.id 
    if @comment.save
      #for ajax
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash.now[:alert] = "Error, comment not posted."
      render root_path
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    
    if @comment.user_id == current_user.id
      @comment.delete
      #for ajax
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end

class RepliesController < ApplicationController
  
  def show
  end
  
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.create(params[:reply].permit(:reply))
    @reply.user_id = current_user.id if current_user
    @reply.save
    redirect_to @post
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @reply = @post.replies.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @reply = @post.replies.find(params[:id])
    if @reply.update(params[:reply].permit(:reply))
      redirect_to @post
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @reply = @post.replies.find(params[:id])
    @reply.destroy
    redirect_to @post
  end

end

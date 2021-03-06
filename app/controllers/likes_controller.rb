class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    unless (@post.find_like(current_user))
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to URI(request.referer).path
  end

  def destroy
    @like.destroy if !(@post.find_like(current_user))
    redirect_to URI(request.referer).path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

end

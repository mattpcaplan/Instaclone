class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(allow_post)
    if @post.save
      flash[:submitted] = "Submitted!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
  end
end


  private
    def allow_post
      params.require(:post).permit(:image, :description)
    end
end

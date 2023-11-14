class PostsController < ApplicationController
  before_action :set_post, except: %i[index show new create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post), notice: 'Post was successfully updated.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def comment
    @comment = @post.comments.build(comment_params)

    redirect_to post_url(@post), notice: 'Post was successfully updated.' if @comment.save
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :tags)
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end

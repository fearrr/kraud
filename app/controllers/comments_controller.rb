class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update_attributes(public: false)
      # Handle a successful update.
      flash[:success] = "Отзыв добавлен"
      redirect_to abouts_url
    else
      render 'new'
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(publish_comment_params)
      # Handle a successful update.
      flash[:success] = "Отзыв обновлен"
      redirect_to comments_url
    else
      render 'edit'
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Отзыв удален"
    redirect_to comments_url
  end



  private
  def comment_params
    params.require(:comment).permit(:body, :email, :name, :public)
  end
  def publish_comment_params
    params.require(:comment).permit(:body, :public)
  end
end

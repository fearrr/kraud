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
      # Handle a successful update.
      flash[:success] = "Комментарий добавлен"
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
      flash[:success] = "Комментарий обновлен"
      redirect_to comments_url
    else
      render 'edit'
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Комментарий удалена"
    redirect_to comments_url
  end



  private
  def comment_params
    params.require(:comment).permit(:body, :email, :name, :public=>false)
  end
  def publish_comment_params
    params.require(:comment).permit(:body, :public)
  end
end

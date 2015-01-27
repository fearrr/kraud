class CaptionsController < ApplicationController
  def index
    @captions = Caption.all
  end
  def new
    @caption = Caption.new
  end
  def create
    @caption = Caption.new(randomText_params)
    if @caption.save
      # Handle a successful update.
      flash[:success] = "Добавлена случайная фраза"
      redirect_to captions_path
    else
      render 'new'
    end
  end
  def edit
    @caption = Caption.find(params[:id])
  end
  def update
    @caption = Caption.find(params[:id])
    if @caption.update_attributes(randomText_params)
      # Handle a successful update.
      flash[:success] = "Случайная фраза обновлена"
      redirect_to captions_path
    else
      render 'edit'
    end
  end
  def destroy
    @caption = Caption.find(params[:id])
    @caption.destroy
    flash[:success] = "Случайная фраза удалена"
    redirect_to captions_path
  end

  private
  def randomText_params
    params.require(:caption).permit(:body)
  end
end

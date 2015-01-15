class TidingsController < ApplicationController
  # encoding: UTF-8
  impressionist :actions=>[:show, :index]
  def index
    @tiding = Tiding.all.order('created_at DESC')
  end
  def show
    @tiding = Tiding.find(params[:id])
    @impression = @tiding.impressionist_count(:filter=>:all)
  end
  def new
    @tiding = Tiding.new
  end
  def create
    @tiding = Tiding.new(tidings_param)
    if @tiding.save
      # Handle a successful save.
      flash[:success] = "Новость добавлена"
      redirect_to tidings_url
    else
      render 'new'
    end
  end
  def edit
    @tiding = Tiding.find(params[:id])
  end
  def update
    @tiding = Tiding.find(params[:id])
    if @tiding.update_attributes(tidings_param)
      # Handle a successful update.
      flash[:success] = "Новость обновлена"
      redirect_to tidings_url
    else
      render 'edit'
    end
  end
  def destroy
    @tiding = Tiding.find(params[:id])
    @tiding.destroy
    flash[:success] = "Новость удалена"
    redirect_to tidings_url
  end
  private
  def tidings_param
    params.require(:tiding).permit(:title, :body)
  end
end

class TidingsController < ApplicationController
  # encoding: UTF-8
  impressionist :actions=>[:show, :index]
  def index
    @tiding = Tiding.all
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

  private
  def tidings_param
    params.require(:tiding).permit(:title, :body)
  end
end

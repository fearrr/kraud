class TidingsController < ApplicationController
  # encoding: UTF-8
  respond_to :html, :xml, :json, :js
  before_action :logged_in_admin, only: [:edit, :update, :new]
  impressionist :actions=>[:show, :index]
  def index
    get_and_show_posts
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
    params.require(:tiding).permit(:image, :title, :body)
  end
  # Confirms a logged-in user.
  def logged_in_admin
    unless logged_in?
      store_location
      flash[:danger] = "Зайдите как администратор"
      redirect_to login_url
    end
  end

  def get_and_show_posts
    @tidings = Tiding.paginate(page: params[:page], per_page: 3).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end
end

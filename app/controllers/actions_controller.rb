class ActionsController < ApplicationController
  # encoding: UTF-8
  impressionist :actions=>[:show, :index]
  def index
    @action = Action.all
  end
  def show
    @action = Action.find(params[:id])
    @impression = @action.impressionist_count(:filter=>:all)
  end
  def new
    @action = Action.new
  end
  def create
    @action = Action.new(action_params)
    if @action.save
      # Handle a successful save.
      flash[:success] = "Новая акция добавлена"
      redirect_to actions_url
    else
      render 'new'
    end
  end

  private
  def action_params
    params.require(:foo).permit(:title, :body)
  end
end

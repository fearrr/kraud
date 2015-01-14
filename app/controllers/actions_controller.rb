class ActionsController < ApplicationController
  # encoding: UTF-8
  def index
    @action = Action.all
  end
  def show

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

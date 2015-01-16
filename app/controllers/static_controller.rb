class StaticController < ApplicationController
  def index
    @actions = Action.order('created_at DESC').limit(4)
    @tidings = Tiding.order('created_at DESC').limit(4)
  end
end

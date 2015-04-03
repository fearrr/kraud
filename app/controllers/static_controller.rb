class StaticController < ApplicationController
  def index
    @actions = Action.order('created_at DESC').limit(4)
    @tidings = Tiding.order('created_at DESC').limit(4)
    @comments = Comment.where("public = ?", true).order('created_at DESC')
    @sliders = Slider.all
    @main = Main.find(1)
  end
end

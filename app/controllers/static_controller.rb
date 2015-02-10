class StaticController < ApplicationController
  def index
    @actions = Action.order('created_at DESC').limit(4)
    @tidings = Tiding.order('created_at DESC').limit(4)

    @kombikorm = Part.where(section: "Комбикормовое оборудование").limit(2)
    @pellet = Part.where(section: "Пеллетное оборудование").limit(2)
    @kombikorm_all = Part.where(section: "Комбикормовое оборудование")
    @pellet_all = Part.where(section: "Пеллетное оборудование")

    @sections = Part.uniq.pluck(:section)

    @comments = Comment.where("public = ?", true).order('created_at DESC')

    @sliders = Slider.all

    @main = Main.find(1)
  end
end

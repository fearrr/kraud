class StaticController < ApplicationController
  def index
    @actions = Action.order('created_at DESC').limit(4)
    @tidings = Tiding.order('created_at DESC').limit(4)

    @kombikorm = Part.where(section: "Комбикормовое оборудование").limit(2)
    @pellet = Part.where(section: "Пеллетное оборудование").limit(2)
    @sections = Part.uniq.pluck(:section)

    # @pellet_items = Item.where("section = ?", @pellet.first.section)


  end
end

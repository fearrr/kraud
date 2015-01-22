class StaticController < ApplicationController
  def index
    @actions = Action.order('created_at DESC').limit(4)
    @tidings = Tiding.order('created_at DESC').limit(4)

    @kombikorm = Type.where(section_name: "Комбикормовое оборудование").limit(2)
    @pellet = Type.where(section_name: "Пеллетное оборудование").limit(2)
    @sections = Type.uniq.pluck(:section_name)

    @pellet_items = Item.where("section = ?", @pellet.first.section_name)
  end
end

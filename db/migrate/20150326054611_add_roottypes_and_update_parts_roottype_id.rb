class AddRoottypesAndUpdatePartsRoottypeId < ActiveRecord::Migration
  def change
    kombikorm = Roottype.create(title: "Комбикорм")
    pellets = Roottype.create(title: "Пеллеты")

    Part.where('section = ?', "Комбикормовое оборудование").update_all(root_type_id: kombikorm.id)
    Part.where('section = ?', "Пеллетное оборудование").update_all(root_type_id: pellets.id)
  end
end

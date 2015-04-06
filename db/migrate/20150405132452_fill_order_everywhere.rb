class FillOrderEverywhere < ActiveRecord::Migration
  def change
    #set default order to each item in db
    roottypes = Roottype.all
    roottypes.each_with_index do |roottype, i|
      roottype.update_attributes(order: i+1)
      parts = roottype.parts
      parts.each_with_index do |part, j|
        part.update_attributes(order: j+1)
        types = part.types
        types.each_with_index do |type, k|
          type.update_attributes(order: k+1)
          items = type.items
          items.each_with_index do |item, l|
            item.update_attributes(order: l+1)
          end
        end
      end
    end
  end
end

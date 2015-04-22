# Main page
crumb :root do
  link "Главная", root_path
end

# Tidings
crumb :tidings do
  link "Новости", tidings_path
end
crumb :tiding do |tiding|
  link tiding.title, tiding
  parent :tidings
end
crumb :edit_tiding do |tiding|
  link "Изменить", tiding
  parent tiding
end
crumb :add_tiding do
  link "Добавить", new_tiding_path
  parent :tidings
end

# Actions
crumb :actions do
  link "Статьи", actions_path
end
crumb :action do |action|
  link action.title, action
  parent :actions
end
crumb :edit_action do |action|
  link "Изменить", action
  parent action
end
crumb :add_action do
  link "Добавить", new_action_path
  parent :actions
end

# About
crumb :about do
  link "О компании", abouts_path
end
crumb :edit_about do
  link "Редактировать страницу", abouts_path
  parent :about
end
crumb :comments do
  link "Управление отзывами", comments_path
  parent :about
end
crumb :new_comment do
  link "Добавить отзыв", new_comment_path
  parent :about
end
crumb :edit_comment do
  link "Редактировать"
  parent :comments
end
crumb :edit_main do
  link "Редактировать страницу"
end


# Contact
crumb :contact do
  link "Контакты", contacts_path
end
crumb :edit_contact do
  link "Редактировать страницу", contacts_path
  parent :contact
end


# Catalog main
crumb :catalog do
  link "Каталог", parts_path
end

# Catalog add new action
crumb :add_roottype do
  link "Добавить категорию", new_part_path
  parent :catalog
end
crumb :add_part do
  link "Добавить раздел", new_part_path
  parent :catalog
end
crumb :add_type do
  link "Добавить подраздел", new_type_path
  parent :catalog
end
crumb :add_item do
  link "Добавить материал", new_item_path
  parent :catalog
end

# Catalog show action
crumb :roottype do |roottype|
  link roottype.title, roottype
  parent :catalog
end
crumb :part do |part|
  link part.title, part
  parent :roottype, part.roottype
end
crumb :type do |type|
  link type.title, type
  parent :part, type.part
end
crumb :item do |item|
  link item.title, item
  parent :type, item.type
end

crumb :only_item do |item|
  link item.title, item
  parent :part, item.type.part
end


# Catalog edit action
crumb :edit_roottype do |roottype|
  link "Изменить категорию", roottype
  parent :catalog
end
crumb :edit_part do |part|
  link "Изменить раздел", part
  parent :part, part
end

crumb :edit_type do |type|
  link "Изменить подраздел", type
  parent :type, type
end

crumb :edit_item do |item|
  link "Изменить", item
  parent :item, item
end


# Captions
crumb :captions do
  link "Управление случайными фразами", captions_path
end
crumb :add_caption do
  link "Добавить", new_caption_path
  parent :captions
end
crumb :edit_caption do
  link "Редактировать"
  parent :captions
end


#admins and sessions
crumb :new_admin do
  link "Регистрация администратора", new_admin_path
end
crumb :login do
  link "Аутентификация", new_admin_path
end
crumb :edit_admin do
  link "Редактирование профиля"
end


# Slider
crumb :sliders do
  link "Управление сладером", sliders_path
end
crumb :new_slider do
  link "Новое изображение"
  parent :sliders
end
crumb :edit_slider do
  link "Редактировать"
  parent :sliders
end

# Globals
crumb :globals do
  link "Глобальные параметры", globals_path
end
crumb :edit_globals do
  link "Редактировать"
  parent :globals
end

# Photogal
crumb :photogal do
  link "Галерея", photogals_path
end
crumb :new_photogal do
  link "Добавить изображения в галерею", new_photogal_path
end

crumb :edit_asset do
  link "Редактировать фотографию", photogals_path
end

crumb :roottypes_order do
  link "Категории оборудования", roottypes_order_path
  parent :catalog
end

crumb :parts_order do |roottype|
  link roottype.title, parts_order_path(roottype_id: roottype.id)
  parent :roottypes_order
end

crumb :types_order do |part|
  link part.title, types_order_path(part_id: part.id)
  parent :parts_order, part.roottype
end

crumb :items_order do |type|
  link type.title, items_order_path(type_id: type.id)
  parent :types_order, type.part
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
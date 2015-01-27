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
  link "Акции", actions_path
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


# Contact
crumb :contact do
  link "Контакты", contacts_path
end
crumb :edit_contact do
  link "Редактировать страницу", contacts_path
  parent :contact
end



# Catalog
crumb :catalog do
  link "Каталог", types_path
end
crumb :add_type do
  link "Добавить раздел", new_type_path
  parent :catalog
end
crumb :add_material do
  link "Добавить материал", new_item_path
  parent :catalog
end
crumb :kombikorm do
  link "Линии производства комбикорма", kombikorm_path
  parent :catalog
end
crumb :pellet do
  link "Линии производства пеллет", pellet_path
  parent :catalog
end
crumb :type_kombikorm do |type|
  link type.title, type
  parent :kombikorm
end
crumb :type_pellet do |type|
  link type.title, type
  parent :pellet
end
crumb :item_kombikorm do |item, type|
  link item.title, item
  parent :type_kombikorm, type
end
crumb :item_pellet do |item, type|
  link item.title, item
  parent :type_pellet, type
end
crumb :edit_type_pellet do |type|
  link "Изменить", type
  parent :type_pellet, type
end
crumb :edit_type_kombikorm do |type|
  link "Изменить", type
  parent :type_kombikorm, type
end
crumb :edit_item_kombikorm do |item, type|
  link "Изменить", item
  parent :item_kombikorm, item, type
end
crumb :edit_item_pellet do |item, type|
  link "Изменить", item
  parent :item_pellet, item, type
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


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
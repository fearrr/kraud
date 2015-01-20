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
  link "Линии проризводства комбикорма", kombikorm_path
  parent :catalog
end
crumb :pellet do
  link "Линии проризводства пеллет", pellet_path
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


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
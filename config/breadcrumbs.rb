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

# About
crumb :about do
  link "О компании", abouts_path
end
crumb :edit_about do
  link "Изменить", abouts_path
  parent :about
end

# Contact
crumb :contact do
  link "Контакты", contact_path
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
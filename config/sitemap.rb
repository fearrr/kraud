# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.kraud.org"

SitemapGenerator::Sitemap.create do

    add 'parts/pellet', :changefreq => 'weekly'
    add 'parts/kombikorm', :changefreq => 'weekly'
    add 'abouts', :changefreq => 'weekly'
    add 'contacts', :changefreq => 'weekly'
    Action.find_each do |action|
      add action_path(action), lastmod: action.updated_at
    end
    Tiding.find_each do |tiding|
      add tiding_path(tiding), lastmod: tiding.updated_at
    end
    Part.find_each do |part|
      add part_path(part), lastmod: part.updated_at
    end
    Type.find_each do |type|
      add type_path(type), lastmod: type.updated_at
    end
    Item.find_each do |item|
      add item_path(item), lastmod: item.updated_at
    end
    Comment.find_each do |comment|
      add comment_path(comment), lastmod: comment.updated_at
    end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

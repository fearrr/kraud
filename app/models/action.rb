class Action < ActiveRecord::Base
  is_impressionable
  validates :title, :presence=>true
  validates :body, :presence=>true
end

class Item < ActiveRecord::Base
  belongs_to :type
  validates :section, :presence=>true
  validates :body, :presence=>true
  validates :title, :presence=>true
end

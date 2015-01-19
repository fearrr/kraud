class Item < ActiveRecord::Base
  belongs_to :type
  validates :type_id, :presence=>true
  validates :section, :presence=>true
  validates :body, :presence=>true
end

class Type < ActiveRecord::Base
  has_many :items
  validates :title, :presence=>true
end

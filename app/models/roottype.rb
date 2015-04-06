class Roottype < ActiveRecord::Base
  has_many :parts
  accepts_nested_attributes_for :parts, :allow_destroy => true
  validates :title, :presence => true
  default_scope { order(:order) }
end

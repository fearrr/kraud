class Part < ActiveRecord::Base
  has_many :types
  accepts_nested_attributes_for :types, :allow_destroy => true
  validates :title, :presence=>true
end

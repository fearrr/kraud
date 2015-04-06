class Part < ActiveRecord::Base
  has_many :types
  belongs_to :roottype
  accepts_nested_attributes_for :types, :allow_destroy => true
  validates_presence_of :title
  default_scope { order(:order) }
end

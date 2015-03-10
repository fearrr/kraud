class Type < ActiveRecord::Base
  has_many :items
  belongs_to :part
  accepts_nested_attributes_for :items, :allow_destroy => true
  validates :title, :presence=>true
end

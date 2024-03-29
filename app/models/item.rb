class Item < ActiveRecord::Base
  belongs_to :type

  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true

  validates :body, :presence => true
  validates :title, :presence => true
  default_scope { order(:order) }
end

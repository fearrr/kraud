class Photogal < ActiveRecord::Base
  has_many :photogal_assets, :as => :attachable
  accepts_nested_attributes_for :photogal_assets, :allow_destroy => true
end

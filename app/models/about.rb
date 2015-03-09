class About < ActiveRecord::Base
  has_many :about_assets, :as => :attachable
  accepts_nested_attributes_for :about_assets, :allow_destroy => true
end

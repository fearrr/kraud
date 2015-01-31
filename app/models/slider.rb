class Slider < ActiveRecord::Base
  has_attached_file :image, :styles => { :normal => "1120x300>", :preview => "200x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

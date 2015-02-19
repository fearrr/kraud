class Action < ActiveRecord::Base
  is_impressionable

  has_attached_file :image, :styles => {:preview => "310x230#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, :presence=>true
  validates :body, :presence=>true
end

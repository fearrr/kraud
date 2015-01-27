class Caption < ActiveRecord::Base
  validates :body, :presence=>true
end

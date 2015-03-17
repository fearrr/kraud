class Caption < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 50 }
end

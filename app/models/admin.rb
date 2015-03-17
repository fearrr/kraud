class Admin < ActiveRecord::Base
  attr_accessor :remember_token # virtual param (not in DB)
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  # Returns the hash digest of the given string (for admin_login test)
  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Admin.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers an admin in the database for use in persistent sessions.
  def remember
    self.remember_token = Admin.new_token
    update_attribute(:remember_digest, Admin.digest(remember_token))
  end

  # Forgets an admin.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end

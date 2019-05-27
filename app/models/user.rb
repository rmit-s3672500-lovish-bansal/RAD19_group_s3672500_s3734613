class User < ApplicationRecord
  has_many :course, dependent: :destroy
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { minimum: 3, maximum: 25 }
  VALID_RMIT_MAIL_REGEX = /[a-z].[a-z]@rmit.edu.au/i.freeze
  # VALID_PASSWORD_REGEX = /(?=.[a-zA-Z])(?=.[0-9])(?=.*[\W]).{8,}/i.freeze
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/i
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: VALID_RMIT_MAIL_REGEX,
                              message: 'registration only open for RMIT staff' },
                    length: { minimum: 4, maximum: 70 },
                    presence: true
  has_secure_password
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'must contain at least a lowercase letter,
                                a uppercase, a digit, a special character and 8+ characters' }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
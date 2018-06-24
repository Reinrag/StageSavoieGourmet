class User < ActiveRecord::Base
  validates :username, presence: true,
                        uniqueness: { case_sensitive: false},
                        length: {minimum: 3, maximum: 25}
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false},
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  has_secure_password
  has_secure_token :confirmation_token
  def to_session
    {id: id}
  end
end
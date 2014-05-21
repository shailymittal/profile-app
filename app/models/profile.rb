class Profile < ActiveRecord::Base
    validates :username,  presence: true, length: { minimum: 5 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password,
                          if: lambda { |m| m.password.present? }
end
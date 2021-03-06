require 'bcrypt'
class User < ApplicationRecord
  attr_accessor :reset_token

  include Elasticsearch::Model
  searchkick
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_interest
  has_many :interests, through: :user_interest

  accepts_nested_attributes_for :user_skills
  accepts_nested_attributes_for :user_interest

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def phonenumber=(phonenumber)
    self[:phonenumber] = phonenumber.gsub(/\D/, '')
  end #http://stackoverflow.com/questions/10214950/how-to-format-values-before-saving-to-database-in-rails-3

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
end

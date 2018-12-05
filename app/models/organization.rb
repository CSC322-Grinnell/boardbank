class Organization < ApplicationRecord
  attr_accessor :reset_token

  include Elasticsearch::Model
  searchkick

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Organizations.new_token
    update_attribute(:reset_digest,  Organizations.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

end

class Organization < ApplicationRecord

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

end

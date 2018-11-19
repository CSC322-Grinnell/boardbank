class User < ApplicationRecord
  
  include Elasticsearch::Model
  searchkick
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :previous_experience, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability, :additional_comments, :user_skills, :user_skills_attributes, :shownumber

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_interest
  has_many :interests, through: :user_interest

  accepts_nested_attributes_for :user_skills
  accepts_nested_attributes_for :user_interest
  
  def phonenumber=(phonenumber)
    self[:phonenumber] = phonenumber.gsub(/\D/, '')
  end #http://stackoverflow.com/questions/10214950/how-to-format-values-before-saving-to-database-in-rails-3
  
end

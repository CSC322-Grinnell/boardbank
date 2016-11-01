class User < ActiveRecord::Base
  
  include Elasticsearch::Model
  searchkick
  
  # def search_data
  #   {
  #     #user_skills_id: user_skills.pluck(:skill_id),
  #     #user_skills_experience_level: user_skills.pluck(:experience_level)
  #     user_skills_id: user_skills.map(&:skill_id),
  #     user_skills_experience_level: user_skills.map(&:experience_level)
  #     #tag_name: tags.map(&:name)
  #   }
  # end
  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :previous_experience, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability

  #     indexes :user_skills, :type => "nested" do 
  #       indexes :skill_id
  #       indexes :experience_level
  #       indexes :user_id
  #     end
  #   end
  # end
  # User.__elasticsearch__.create_index! force: true
  # User.__elasticsearch__.refresh_index!
  
  
  # def as_indexed_json(options={})
  # self.as_json(
  #   include: {user_skills: {include: [:skill_id, :experience_level, :name, :user_id]}}
  #   )
  # end

  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :previous_experience, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability, :additional_comments, :user_skills
  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_interest
  has_many :interests, through: :user_interest

  accepts_nested_attributes_for :user_skills
  accepts_nested_attributes_for :user_interest
  
  
end

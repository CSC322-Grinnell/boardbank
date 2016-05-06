class UserlistController < ApplicationController
  def show
    
      
    
    @users = User.search params[:q] if params[:q].present?
    @users = User.all if !(params[:q]).present?
    @skills = Skill.all
    
    #go to error view if @users.empty?
    #@orgs ||= Organization.search "Happy"
    #@categories = ['']
    #@all_categories = ['Arts/Musuem', 'Early Childhood', 'Literacy', 'Animal Rights', 'Environmental', 'Mental Health', 'Children/Youth', 'Health Care', 'Recreation', 'Civic/Community', 'Historical', 'Preservation', 'Senior Services', 'Disabilities', 'Homeless/Emergency', 'Substance Abuse', 'Education', 'Housing Development']

    
    #@interests = Interest.all

    #if params[:interests]
      #interest_ids = params[:interests].map(&:to_i)
      # Search for users that have the interests checked on the form
     #@users = User.joins(:user_interest).where('interest_id in (?)', interest_ids)

    #else
    #@users = User.all
    #end
  end

  def index
  end
end

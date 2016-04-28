class OrglistController < ApplicationController

  #@orgs = Organization.all

  def show

    @orgs = Organization.search params[:q] if params[:q].present?
    @orgs = Organization.all if !(params[:q]).present?
    #@orgs ||= Organization.search "Happy"
    @categories = ['']
    @all_categories = ['Arts/Musuem', 'Early Childhood', 'Literacy', 'Animal Rights', 'Environmental', 'Mental Health', 'Children/Youth', 'Health Care', 'Recreation', 'Civic/Community', 'Historical', 'Preservation', 'Senior Services', 'Disabilities', 'Homeless/Emergency', 'Substance Abuse', 'Education', 'Housing Development']
 end


# def search_path
#   q = params[:q]
#   @orgs = Organization.search "Happy"
#   #@orgs = Organization.search "Happy"
#   render action: 'show'
#
#end

end

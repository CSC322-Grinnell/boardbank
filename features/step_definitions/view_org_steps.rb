
Given /the following organizations exist/ do |org_table|
  org_table.hashes.each do |org|
    Organization.create!(:orgname => org["OName"], :orgabout => org["About"], :email => org["Email"], :password => org["Password"])
    end
  end
